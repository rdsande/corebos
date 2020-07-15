let fileurl = 'module=com_vtiger_workflow&action=com_vtiger_workflowAjax&file=getrelatedmods&currentmodule='+moduleName;
$(document).ready(function () {
	jQuery.ajax({
		method: 'GET',
		url: 'index.php?' + fileurl
	}).done(function (modlistres) {
		document.getElementById('relModlist_type').innerHTML =modlistres;
	});
});

function changeIdlistVal(recval) {
	var idinputval = document.getElementById('idlist').value;
	if (document.getElementById('checkbox-'+recval).checked) {
		document.getElementById('idlist').value = (idinputval == '') ? recval : idinputval+','+recval;
	} else {
		var idlistvals=idinputval.split(',');
		for (var i = 0; i < idlistvals.length; i++) {
			if (idlistvals[i] == recval) {
				idlistvals.splice(i, 1);
				document.getElementById('idlist').value = idlistvals;
			}
		}
	}
}

function doGlobalGridSelect() {
	let ops = document.querySelectorAll("input[name='options[]']");
	let globalcheck = document.getElementById('checkbox-0').checked;
	let idlist = '';
	for (let op = 0; op < ops.length; ++op) {
		ops[op].checked = globalcheck;
		if (globalcheck) {
			if (idlist=='') {
				idlist = ops[op].value;
			} else {
				idlist += ','+ops[op].value;
			}
		}
	}
	document.getElementById('idlist').value = idlist;
}

function addrecList(recId, recvalue) {
	var reclist =
		`<div class="slds-grid" id="row-${recId}">
			<div class="slds-col slds-size_1-of-12 slds-p-around_x-small">
				<div class="slds-checkbox">
					<input type="checkbox" onclick="changeIdlistVal(${recId})" name="options[]" value=${recId} id="checkbox-${recId}" aria-labelledby="check-button-label-04 column-group-header" value="checkbox-04" checked />
						<label class="slds-checkbox__label" for="checkbox-${recId}" id="check-button-label-04">
						<span class="slds-checkbox_faux"></span>
						<span class="slds-form-element__label slds-assistive-text">Select item 4</span>
						</label>
				</div>
			</div>
			<div class="slds-col slds-size_4-of-12 slds-p-around_x-small">
				<div class="slds-truncate">${(document.getElementById('radio-5').checked ? '*' : recvalue)}</div>
			</div>
			<div class="slds-col slds-size_4-of-12 slds-p-around_x-small">
				<div class="slds-truncate slds-float_right">${document.getElementById('relModlist_type').value}</div>
			</div>
		</div>`;
	return reclist;
}

jQuery(document).ready(function () {
	var recsavedDiv='';
	if (relrecords.length > 0) {
		for (var i=0; i<relrecords.length; i++) {
			var reclist =`
			<div class="slds-grid slds-p-horizontal_x-large" id="row-${relrecords[i].recid}">
				<div class="slds-col slds-size_1-of-12 slds-p-around_x-small">
					<div class="slds-checkbox">
						<input type="checkbox" onclick="changeIdlistVal(${relrecords[i].recid})" name="options[]" value=${relrecords[i].recid} id="checkbox-${relrecords[i].recid}" aria-labelledby="check-button-label-04 column-group-header" value="checkbox-04" checked />
						<label class="slds-checkbox__label" for="checkbox-${relrecords[i].recid}" id="check-button-label-04">
						<span class="slds-checkbox_faux"></span>
						<span class="slds-form-element__label slds-assistive-text">Select item 4</span>
						</label>
					</div>
				</div>
				<div class="slds-col slds-size_4-of-12 slds-p-around_x-small" data-label="Entity Name">
					<div class="slds-truncate">${(document.getElementById('radio-5').checked ? '*' : relrecords[i].entityName)}</div>
				</div>
				<div class="slds-col slds-size_4-of-12 slds-p-around_x-small" data-label="Entity">
					<div class="slds-truncate slds-float_right">${relrecords[i].entityType}</div>
				</div>
			</div>`;
			recsavedDiv += reclist;
		}
		document.getElementById('selected_recordsDiv').innerHTML = recsavedDiv;
	}
});
