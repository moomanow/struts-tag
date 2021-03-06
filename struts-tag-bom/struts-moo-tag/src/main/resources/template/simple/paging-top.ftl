<#--
/*
 * $Id$
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->

	<div class="row">
	    <div class="col-md-12">
			<div class="inline">
				<label class="control-label">
				<@s.text name="COMMON_PAGING_SHOW"></@s.text> 
				</label>
				<select 
					class="form-control paging-select inline rowsPerPage_${parameters.id}" 
					id="rowsPerPage_Top_${parameters.id}" 
					name="rowsPerPage" 
					onchange="rowsPerPage_Top_${parameters.id}_select()">
					<option value="5"
						<#if parameters.rowsPerPage?default(parameters.defaultShowPerPage) == 5>
							selected="selected"
						</#if>
					>5</option>
					<option value="10"
						<#if parameters.rowsPerPage?default(parameters.defaultShowPerPage) == 10>
							selected="selected"
						</#if>
					>10</option>
					<option value="20"
						<#if parameters.rowsPerPage?default(parameters.defaultShowPerPage) == 20>
							selected="selected"
						</#if>
					>20</option>
					<option value="50"
						<#if parameters.rowsPerPage?default(parameters.defaultShowPerPage) == 50>
							selected="selected"
						</#if>
					>50</option>
					<option value="100"
						<#if parameters.rowsPerPage?default(parameters.defaultShowPerPage) == 100>
							selected="selected"
						</#if>
					>100</option>
				</select>
				<script>
					function rowsPerPage_Top_${parameters.id}_select(){
						$('#currentPage_${parameters.id}').val('1');
						$('#rowsPerPage_${parameters.id}').val($('#rowsPerPage_Top_${parameters.id}').val());
						${parameters.id}_goToPage();
					}
				</script>
				<label class="control-label">
				<@s.text name="COMMON_PAGING_ROWS"></@s.text> 
				</label>
			</div>
			<script>
					function ${parameters.id}_goToPage(){
						<#if parameters.isAjax?default("false") == "false">
								$('#${parameters.id}').submit();
							<#else>
								<#if parameters.ajaxFunction??>
									${parameters.ajaxFunction}
								</#if>
						</#if>
					}
			</script>
			<br class="hidden-md hidden-lg">
			<ul id="${parameters.id}_pagination_top" class="pagination pull-right inline ${parameters.id}_pagination">
				<#if parameters.isAjax??>
					<@s.hidden id="currentPage_${parameters.id}" name="pagingBean.currentPage"></@s.hidden>
					<@s.hidden id="rowsPerPage_${parameters.id}" name="pagingBean.rowsPerPage" value="${parameters.rowsPerPage?default(parameters.defaultShowPerPage)}"></@s.hidden>
			 		<script>
			 			function ${parameters.id}_reset_paging(){
			 				$('.${parameters.id}_label').children().remove();
							$('.${parameters.id}_label').append('<label class="control-label">Showing 0 to 0 from Total 0 rows</label>');
							$('.${parameters.id}_pagination li').remove();
							var paging = "";
							paging += '<li><span>&laquo;</span></li>';
							paging += '<li><span>1</span></li>';
							paging += '<li><span>&raquo;</span></li>';
							$('.${parameters.id}_pagination').append(paging);
			 			}
						function ${parameters.id}_append_paging(pagingBean){
							var currentRow = pagingBean.currentPage * pagingBean.rowsPerPage - pagingBean.rowsPerPage + 1;
							if(pagingBean.currentPage == pagingBean.pageCount){
								var endRows = pagingBean.totalRows;
							}else{
								var endRows = pagingBean.currentPage * pagingBean.rowsPerPage;
							}
							$('.${parameters.id}_label').children().remove();
							$('.${parameters.id}_label').append('<label class="control-label">Showing '+ currentRow +' to '+ endRows +' from Total '+ pagingBean.totalRows + ' rows</label>');
							
							$('.rowsPerPage_${parameters.id}').val(pagingBean.rowsPerPage);
							$('.${parameters.id}_pagination li').remove();
							var lastGroupPaging = pagingBean.pageCount-5;
							var paging = "";
							if(pagingBean.currentPage == 1){
								paging += '<li><span>&laquo;</span></li>';
							}else{
								paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ pagingBean.previousPage +');${parameters.id}_goToPage();">&laquo;</a></li>';
							}
							$('.${parameters.id}_pagination').append(paging);
							
							if(pagingBean.pageCount < 10){
								for(i=1; i<=pagingBean.pageCount; i++){
									var paging = "";
									if(i == pagingBean.currentPage){
										paging += '<li><span>'+ pagingBean.currentPage +'</span></li>';
									}else{
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ i +');${parameters.id}_goToPage();">'+ i +'</a></li>';
									}
									$('.${parameters.id}_pagination').append(paging);
								}
							}else if(pagingBean.currentPage < 6){
								for(i=1; i<=pagingBean.pageCount; i++){
									var paging = "";
									if(i == pagingBean.currentPage){
										paging += '<li><span>'+ pagingBean.currentPage +'</span></li>';
									}else{
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ i +');${parameters.id}_goToPage();">'+ i +'</a></li>';
									}
									if(i > 6 && pagingBean.pageCount > 9){
									var beforelastPage = pagingBean.pageCount - 1;
										paging += '<li><a class="paging-hidden">...</a></li>';
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ beforelastPage +');${parameters.id}_goToPage();">'+ beforelastPage +'</a></li>';
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ pagingBean.pageCount +');${parameters.id}_goToPage();">'+ pagingBean.pageCount +'</a></li>';
									}									
									$('.${parameters.id}_pagination').append(paging);
									if(i > 6 && pagingBean.pageCount > 9){
										break;
									}	
								}
							}else if(pagingBean.currentPage > lastGroupPaging){
								for(i=1; i<=pagingBean.pageCount; i++){
									var paging = "";
									var pageCountPlus = pagingBean.pageCount-7;
									if(i == 1){
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val(1);${parameters.id}_goToPage();">1</a></li>';
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val(2);${parameters.id}_goToPage();">2</a></li>';
										paging += '<li><a class="paging-hidden">...</a></li>';
									}	
									if(i == pagingBean.currentPage){
										paging += '<li><span>'+ pagingBean.currentPage +'</span></li>';
									}else if(i > pageCountPlus){
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ i +');${parameters.id}_goToPage();">'+ i +'</a></li>';
									}
									$('.${parameters.id}_pagination').append(paging);
								}
							}else if(pagingBean.currentPage > 5){
								for(i=1; i<=pagingBean.pageCount; i++){
									var paging = "";
									var nextPagePlus = pagingBean.nextPage+1;
									var previousPagePlus = pagingBean.previousPage-1;
									if(i == 1){
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val(1);${parameters.id}_goToPage();">1</a></li>';
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val(2);${parameters.id}_goToPage();">2</a></li>';
										paging += '<li><a class="paging-hidden">...</a></li>';
									}	
									if(i == pagingBean.currentPage){
										paging += '<li><span>'+ pagingBean.currentPage +'</span></li>';
									}else if(i == pagingBean.nextPage || i == nextPagePlus || i == pagingBean.previousPage || i == previousPagePlus){
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ i +');${parameters.id}_goToPage();">'+ i +'</a></li>';
									}
									if(i == pagingBean.pageCount){
									var beforelastPage = pagingBean.pageCount - 1;
										paging += '<li><a class="paging-hidden">...</a></li>';
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ beforelastPage +');${parameters.id}_goToPage();">'+ beforelastPage +'</a></li>';
										paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ pagingBean.pageCount +');${parameters.id}_goToPage();">'+ pagingBean.pageCount +'</a></li>';
									}	
																	
									$('.${parameters.id}_pagination').append(paging);
								}
							}
							var paging = "";
							if(pagingBean.currentPage == pagingBean.pageCount){
								paging += '<li><span>&raquo;</span></li>';
							}else{
								paging += '<li><a onclick="$(\'#currentPage_${parameters.id}\').val('+ pagingBean.nextPage +');${parameters.id}_goToPage();">&raquo;</a></li>';
							}
							$('.${parameters.id}_pagination').append(paging);
							
							
							
						}
					</script>
				<#else>
					<#if parameters.currentPage == 1>
						<li><span>&laquo;</span></li>
						<#else>
							<li><a onclick="$('#currentPage_${parameters.id}').val('${parameters.previousPage?html}');${parameters.id}_goToPage();">&laquo;</a></li>
					</#if>
					<@s.set var="breakLoop" value="%{false}" />
			  		<#if (parameters.pageCount &lt; 10)>
				  		<@s.iterator var="count" begin="1" end="${parameters.pageCount}">
				  			<@s.if test="!#breakLoop">
				  				<@s.if test="%{${parameters.currentPage} == #count}">
				  					<li><span><@s.property value="${parameters.currentPage}"/></span></li>
				  				</@s.if>
				  				<@s.else>
				  					<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="%{#count}"/>');${parameters.id}_goToPage();"><@s.property value="%{#count}"/></a></li>
								</@s.else>
								<@s.if test="%{#count > 10}">
									<@s.set var="#breakLoop" value="%{true}" />
								</@s.if> 
							</@s.if>
				  		</@s.iterator>
				  	
				  	<#elseif (parameters.currentPage &lt; 6)>
				  		<@s.iterator var="count" begin="1" end="${parameters.pageCount}">
				  			<@s.if test="!#breakLoop">
				  				<@s.if test="%{${parameters.currentPage} == #count}">
				  					<li><span><@s.property value="${parameters.currentPage}"/></span></li>
				  				</@s.if>
				  				<@s.else>
				  					<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="%{#count}"/>');${parameters.id}_goToPage();"><@s.property value="%{#count}"/></a></li>
								</@s.else>
								<@s.if test="%{#count > 6 && ${parameters.pageCount} > 9}">
									<li><a class="paging-hidden">...</a></li>
									<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="${parameters.pageCount-1}"/>');${parameters.id}_goToPage();"><@s.property value="${parameters.pageCount-1}"/></a></li>
									<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="${parameters.pageCount}"/>');${parameters.id}_goToPage();"><@s.property value="${parameters.pageCount}"/></a></li>
									<@s.set var="breakLoop" value="%{true}" />
								</@s.if> 
							</@s.if>		
				  		</@s.iterator>
					<#elseif (parameters.currentPage &gt; parameters.pageCount - 5)>
				  		<@s.iterator var="count" begin="1" end="${parameters.pageCount}">
				  			<@s.if test="!#breakLoop">
				  				<@s.if test="%{#count == 1}">
				  					<li><a onclick="$('#currentPage_${parameters.id}').val('1');${parameters.id}_goToPage();">1</a></li>
									<li><a onclick="$('#currentPage_${parameters.id}').val('2');${parameters.id}_goToPage();">2</a></li>
									<li><a class="paging-hidden">...</a></li>
				  				</@s.if>
				  				<@s.if test="%{${parameters.currentPage} == #count}">
				  					<li><span><@s.property value="${parameters.currentPage}"/></span></li>
				  				</@s.if>
				  				<@s.elseif test="%{#count > (${parameters.pageCount-7}) }">
				  					<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="%{#count}"/>');${parameters.id}_goToPage();"><@s.property value="%{#count}"/></a></li>
								</@s.elseif>
								<@s.if test="%{#count == ${parameters.pageCount}}">
									<@s.set var="breakLoop" value="%{true}" />
								</@s.if>
							</@s.if>						  			
				  		</@s.iterator>
			  		<#elseif (parameters.currentPage &gt; 5)>
				  		<@s.iterator var="count" begin="1" end="${parameters.pageCount}">
				  			<@s.if test="!#breakLoop">
				  				<@s.if test="%{#count == 1}">
				  					<li><a onclick="$('#currentPage_${parameters.id}').val('1');${parameters.id}_goToPage();">1</a></li>
									<li><a onclick="$('#currentPage_${parameters.id}').val('2');${parameters.id}_goToPage();">2</a></li>
									<li><a class="paging-hidden">...</a></li>
				  				</@s.if>
				  				<@s.if test="%{${parameters.currentPage} == #count}">
				  					<li><span><@s.property value="${parameters.currentPage}"/></span></li>
				  				</@s.if>
				  				<@s.elseif test="%{#count == ${parameters.currentPage+1} || #count == ${parameters.currentPage+2} || #count == ${parameters.currentPage-1} || #count == ${parameters.currentPage-2}}">
				  					<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="%{#count}"/>');${parameters.id}_goToPage();"><@s.property value="%{#count}"/></a></li>
								</@s.elseif>
								<@s.if test="%{#count == ${parameters.pageCount}}">
									<li><a class="paging-hidden">...</a></li>
									<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="${parameters.pageCount-1}"/>');${parameters.id}_goToPage();"><@s.property value="${parameters.pageCount-1}"/></a></li>
									<li><a onclick="$('#currentPage_${parameters.id}').val('<@s.property value="${parameters.pageCount}"/>');${parameters.id}_goToPage();"><@s.property value="${parameters.pageCount}"/></a></li>
									<@s.set var="breakLoop" value="%{true}" />
								</@s.if>
							</@s.if>						  			
						</@s.iterator>
				  	</#if>
					<#if parameters.currentPage == parameters.pageCount>
						<li><span>&raquo;</span></li>
						<#else>
							<li><a onclick="$('#currentPage_${parameters.id}').val('${parameters.nextPage?html}');${parameters.id}_goToPage();">&raquo;</a></li>
					</#if>
					<#if parameters.currentPage??>
						<@s.hidden id="currentPage_${parameters.id}" name="pagingBean.currentPage" value="${parameters.currentPage}"></@s.hidden>
						<#else>
							<@s.hidden id="currentPage_${parameters.id}" name="pagingBean.currentPage"></@s.hidden>
					</#if>
					<#if parameters.rowsPerPage??>
						<@s.hidden id="rowsPerPage_${parameters.id}" name="pagingBean.rowsPerPage" value="${parameters.rowsPerPage}"></@s.hidden>
						<#else>
							<@s.hidden id="rowsPerPage_${parameters.id}" name="pagingBean.rowsPerPage"></@s.hidden>
				 	</#if>
			 	</#if>
			</ul>
		</div>
	</div>
</form>
<#if (parameters.customOnsubmitEnabled?if_exists)>
<script type="text/javascript">
<#-- 
  Enable auto-select of optiontransferselect tag's entries upon containing form's 
  submission.
-->
<#if (parameters.optiontransferselectIds?if_exists?size > 0)>
	var containingForm = document.getElementById("${parameters.id}");
	<#assign selectObjIds = parameters.optiontransferselectIds.keySet() />
	<#list selectObjIds as selectObjectId>
		StrutsUtils.addEventListener(containingForm, "submit", 
			function(evt) {
				var selectObj = document.getElementById("${selectObjectId}");
				<#if parameters.optiontransferselectIds.get(selectObjectId)??>
					<#assign selectTagHeaderKey = parameters.optiontransferselectIds.get(selectObjectId)/>
					selectAllOptionsExceptSome(selectObj, "key", "${selectTagHeaderKey}");
				<#else>
					selectAllOptionsExceptSome(selectObj, "key", "");
				</#if>
			}, true);
	</#list>
</#if>
<#if (parameters.inputtransferselectIds?if_exists?size > 0)>
	var containingForm = document.getElementById("${parameters.id}");
	<#assign selectObjIds = parameters.inputtransferselectIds.keySet() />
	<#list selectObjIds as selectObjectId>
		StrutsUtils.addEventListener(containingForm, "submit",
			function(evt) {
				var selectObj = document.getElementById("${selectObjectId}");
				<#if parameters.inputtransferselectIds.get(selectObjectId)??>
					<#assign selectTagHeaderKey = parameters.inputtransferselectIds.get(selectObjectId)/>
					selectAllOptionsExceptSome(selectObj, "key", "${selectTagHeaderKey}");
				<#else>
					selectAllOptionsExceptSome(selectObj, "key", "");
				</#if>
			}, true);
	</#list>
</#if>
<#if (parameters.optiontransferselectDoubleIds?if_exists?size > 0)>
	var containingForm = document.getElementById("${parameters.id}");
	<#assign selectDoubleObjIds = parameters.optiontransferselectDoubleIds.keySet() />
	<#list selectDoubleObjIds as selectObjId>
		StrutsUtils.addEventListener(containingForm, "submit", 
			function(evt) {
				var selectObj = document.getElementById("${selectObjId}");
				<#if parameters.optiontransferselectDoubleIds.get(selectObjId)??>
					<#assign selectTagHeaderKey = parameters.optiontransferselectDoubleIds.get(selectObjId)/>
					selectAllOptionsExceptSome(selectObj, "key", "${selectTagHeaderKey}");
				<#else>
					selectAllOptionsExceptSome(selectObj, "key", "");
				</#if>
			}, true);
	</#list>
</#if>


<#--
	Enable auto-select of all elements of updownselect tag upon its containing form
	submission
-->
<#if (parameters.updownselectIds?if_exists?size > 0)>
	var containingForm = document.getElementById("${parameters.id}");
	<#assign tmpIds = parameters.updownselectIds.keySet() />
	<#list tmpIds as tmpId>
		StrutsUtils.addEventListener(containingForm, "submit", 
			function(evt) {
				var updownselectObj = document.getElementById("${tmpId}");
				<#if parameters.updownselectIds.get(tmpId)??>
					<#assign tmpHeaderKey = parameters.updownselectIds.get(tmpId) />
					selectAllOptionsExceptSome(updownselectObj, "key", "${tmpHeaderKey}");
				<#else>
					selectAllOptionsExceptSome(updownselectObj, "key", "");
				</#if>
			}, true);
	</#list>
</#if>
</script>
</#if>


<#-- 
 Code that will add javascript needed for tooltips
--><#t/>
<#if (parameters.hasTooltip?default(false))><#t/>
	<#lt/><!-- javascript that is needed for tooltips -->
	<#lt/><script type="text/javascript" src='<@s.url value="/struts/domTT.js" includeParams="none" encode="false" />'></script>
	<#lt/><link rel="stylesheet" type="text/css" href="<@s.url value="/struts/domTT.css" includeParams="none" encode="false" />"/>
	
</#if><#t/>