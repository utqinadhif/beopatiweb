<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="page-inner">
	<div class="d-sm-flex align-items-center justify-content-between pd-b-20">
		<div class="pageheader pd-t-20 pd-b-0">
			<div class="d-flex justify-content-between">
				<div class="clearfix">
					<div class="breadcrumb pd-0 pd-b-10 mg-0">
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_dashboard');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_content');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title_all');?></a>
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('mod_title_all');?></h4>
				</div>
			</div>
		</div>
		<div class="mg-t-15">
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod.'/add');?>'"><i data-feather="plus" class="mr-2"></i><?php echo lang_line('button_add');?></button>
		</div>
	</div>

	<div class="card">
		<div class="table-responsive">
			<div class="card-body">
				<table id="DataTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th class="no-sort text-center"><input type="checkbox" class="select_all" data-toggle="tooltip" data-placement="top" title="<?php echo lang_line('ui_select_all');?>"></th>
							<th><?php echo lang_line('_id');?></th>
							<th><?php echo lang_line('_title');?></th>
							<th><?php echo lang_line('_category');?></th>
							<th><?php echo lang_line('_datepost');?></th>
							<th><?php echo lang_line('_status');?></th>
							<th class="th-action text-center"><?php echo lang_line('_action');?></th>
						</tr>
					</thead>
					<tbody></tbody>
					<tfoot>
						<tr>
							<td colspan="7">
								<button type="button" class="btn btn-sm btn-danger delete_multi"><?php echo lang_line('button_delete_selected_item');?></button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>