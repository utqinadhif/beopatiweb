<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="page-inner">
	<div class="d-sm-flex align-items-center justify-content-between pd-b-20">
		<div class="pageheader pd-t-20 pd-b-0">
			<div class="d-flex justify-content-between">
				<div class="clearfix">
					<div class="breadcrumb pd-0 pd-b-10 mg-0">
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_dashboard');?></a>
						<a href="<?php echo admin_url('user');?>" class="breadcrumb-item"><?php echo lang_line('ui_users');?></a>
						<a href="<?php echo admin_url($this->mod);?>" class="breadcrumb-item"><?php echo lang_line('mod_title');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('_view_group');?></a>
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('_view_group');?></h4>
				</div>
			</div>
		</div>
		<div class="mg-t-15">
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod);?>'"><i data-feather="arrow-left" class="mr-2"></i><?php echo lang_line('button_back');?></button>
		</div>
	</div>

	<div class="card">
		<div class="table-responsive">
			<div class="card-body">
				<div>
					<p class="tx-medium pull-left"><span class="btn btn-xs rounded-pill btn-white mr-2"><i class="cificon licon-users"></i></span><?php echo lang_line('_group');?></p>
					<a href="<?php echo admin_url($this->mod.'/group/edit/'.$res_group['pk']);?>" class="btn btn-xs btn-white pull-right"><i class="cificon licon-edit mr-1"></i><?php echo lang_line('button_edit');?></a>
					
					<table class="table table-bordered mb-5">
						<tbody>
							<tr>
								<th width="90"><?php echo lang_line('_title');?></th>
								<td><?php echo $res_group['title'];?></td>
							</tr>
							<tr>
								<th width="90"><?php echo lang_line('_group');?></th>
								<td><?php echo $res_group['group'];?></td>
							</tr>
							<tr>
								<th width="90">Key</th>
								<td><?php echo $res_group['pk'];?></td>
							</tr>
						</tbody>
					</table>
				</div>

				<?php if ($keyGroup!='root'): ?>
				<div>
					<p class="tx-medium pull-left"><span class="btn btn-xs rounded-pill btn-white mr-2"><i class="cificon licon-shield"></i></span><?php echo lang_line('_role');?></p>
					<a href="<?php echo admin_url($this->mod.'/role/'.$res_group['pk']);?>" class="btn btn-xs btn-white pull-right"><i class="cificon licon-edit mr-1"></i><?php echo lang_line('button_edit');?></a>
					<table class="table table-striped table-bordered no-footer">
						<thead>
							<tr>
								<th><?php echo lang_line('_module');?></th>
								<th><?php echo lang_line('_read_access');?></th>
								<th><?php echo lang_line('_write_access');?></th>
								<th><?php echo lang_line('_modify_access');?></th>
								<th><?php echo lang_line('_delete_access');?></th>
							</tr>
						</thead>
						<?php foreach ($res_roles as $role): ?>
							<tr>
								<td><?php echo $role['module'];?></td>
								<td><?php echo ($role['read_access']==1 ? '<i class="fa fa-check text-success"></i>' : '<i class="fa fa-times text-danger"></i>');?></td>
								<td><?php echo ($role['write_access']==1 ? '<i class="fa fa-check text-success"></i>' : '<i class="fa fa-times text-danger"></i>');?></td>
								<td><?php echo ($role['modify_access']==1 ? '<i class="fa fa-check text-success"></i>' : '<i class="fa fa-times text-danger"></i>');?></td>
								<td><?php echo ($role['delete_access']==1 ? '<i class="fa fa-check text-success"></i>' : '<i class="fa fa-times text-danger"></i>');?></td>
							</tr>
						<?php endforeach ?>
					</table>
				</div>
				<?php endif ?>
			</div>
		</div>
	</div>
</div>
