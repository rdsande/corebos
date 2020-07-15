{*<!--
	/*************************************************************************************************
	 * Copyright 2014 JPL TSolucio, S.L. -- This file is a part of TSOLUCIO coreBOS Customizations.
	 * Licensed under the vtiger CRM Public License Version 1.1 (the "License"); you may not use this
	 * file except in compliance with the License. You can redistribute it and/or modify it
	 * under the terms of the License. JPL TSolucio, S.L. reserves all rights not expressly
	 * granted by the License. coreBOS distributed by JPL TSolucio S.L. is distributed in
	 * the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
	 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. Unless required by
	 * applicable law or agreed to in writing, software distributed under the License is
	 * distributed on an "AS IS" BASIS, WITHOUT ANY WARRANTIES OR CONDITIONS OF ANY KIND,
	 * either express or implied. See the License for the specific language governing
	 * permissions and limitations under the License. You may obtain a copy of the License
	 * at <http://corebos.org/documentation/doku.php?id=en:devel:vpl11>
	 *************************************************************************************************
	 *  Author       : JPL TSolucio, S. L.
	 *************************************************************************************************//
	-->*}
	<script type="text/javascript">var moduleName = '{$entityName}';</script>
	<script src="modules/com_vtiger_workflow/resources/vtigerwebservices.js" type="text/javascript" charset="utf-8"></script>
	<script src="modules/com_vtiger_workflow/resources/many2manyrelation.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="include/js/vtlib.js"></script>
	<script type="text/javascript" charset="utf-8">
	var relrecords = {$task->relrecords|json_encode};
	</script>
	
	<div class="slds-grid slds-p-horizontal_x-large">
		<div class="slds-col slds-size_8-of-12 slds-p-around_x-small">
			<div class="slds-form">
				<fieldset class="slds-form-element">
					<div class="slds-form-element__control">
						<span class="slds-radio">
							<input type="radio" id="radio-3" name="relAction" {if ($task->selAct eq "addrel")}{"checked"}{/if} value="addrel" />
								<label class="slds-radio__label" for="radio-3">
									<span class="slds-radio_faux"></span>
										<span class="slds-form-element__label">{'Add Relation'|@getTranslatedString}</span>
								</label>
						</span>
						<span class="slds-radio">
							<input type="radio" id="radio-4" name="relAction" {if ($task->selAct eq "delrel")}{"checked"}{/if} value="delrel" />
								<label class="slds-radio__label" for="radio-4">
									<span class="slds-radio_faux"></span>
										<span class="slds-form-element__label">{'Delete Relation'|@getTranslatedString}</span>
								</label>
						</span>
						<span class="slds-radio">
							<input type="radio" id="radio-5" name="relAction" {if ($task->selAct eq "delAllrel")}{"checked"}{/if} value="delAllrel" />
								<label class="slds-radio__label" for="radio-5">
									<span class="slds-radio_faux"></span>
										<span class="slds-form-element__label">{'Delete All Relation'|@getTranslatedString}&nbsp;
											<span>
												<span class="slds-icon_container slds-icon-utility-info" onmouseover="document.getElementById('delallhelp').style.display='block';" onmouseout="document.getElementById('delallhelp').style.display='none';">
													<svg class="slds-icon slds-icon slds-icon_xx-small slds-icon-text-default" aria-hidden="true">
														<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#info" />
													</svg>
												</span>
												<div class="slds-popover slds-popover_tooltip slds-nubbin_left" role="tooltip" id="delallhelp" style="display:none; position: absolute; top: 12px; left: 240px;">
													<div class="slds-popover__body">{'SelectOneRecordOfModule'|@getTranslatedString}</div>
												</div>
											</span>
										</span>
								</label>
						</span>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
	
	<input type="hidden" name="idlist" value="{$task->idlist}" id="idlist">
	
	<div class="slds-grid slds-p-horizontal_x-large">
		<div class="slds-col slds-p-around_x-small">
			<div class="slds-form">
				<div class="slds-form-element">
					<label class="slds-form-element__label" for="relModlist">{'Select Related Module'|@getTranslatedString}</label>
						<div class="slds-form-element__control slds-input-has-fixed-addon">
							<div class="slds-select_container slds-size_6-of-12">
								<select class="slds-select slds-page-header__meta-text" id="relModlist_type">
									<option value="">{'No Module'|@getTranslatedString}</option>
								</select>
								</div>
								<span class="slds-form-element__addon" id="fixed-text-addon-post">
									<svg class="slds-icon slds-icon-text-default" aria-hidden="true" onclick='return vtlib_open_popup_window("","relModlist","{$entityName}","");'>
										<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#new"></use>
									</svg>
								</span>
						</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="slds-page-header">
		<div class="slds-grid slds-p-horizontal_x-large slds-grid_vertical-align-center">
			<div class="slds-col slds-size_1-of-12">
				<div class="slds-th__action slds-th__action_form">
					<div class="slds-checkbox">
						<input type="checkbox" name="options1" id="checkbox-0" tabindex="-1" aria-labelledby="check-select-all-label column-group-header" value="checkbox-0" checked onchange="doGlobalGridSelect();" />
							<label class="slds-checkbox__label" for="checkbox-0" id="check-select-all-label">
								<span class="slds-checkbox_faux"></span>
							</label>
					</div>
				</div>
			</div>
			<div class="slds-col slds-size_4-of-12" aria-label="{'Entity Name'|@getTranslatedString}">
				<div class="slds-grid slds-has-flexi-truncate">
					<span class="slds-truncate" title="{'Entity Name'|@getTranslatedString}">{'Entity Name'|@getTranslatedString}</span>
				</div>
			</div>
			<div class="slds-col slds-size_4-of-12" aria-label="{'Entity Type'|@getTranslatedString}">
				<div class="slds-grid slds-has-flexi-truncate slds-float_right">
					<span class="slds-truncate" title="{'Entity Type'|@getTranslatedString}">{'Entity Type'|@getTranslatedString}</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="slds-p-horizontal_x-large" id="selected_recordsDiv"></div>
	