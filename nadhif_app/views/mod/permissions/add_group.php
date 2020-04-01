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
						<a href="#" class="breadcrumb-item"><?php echo lang_line('_add_group');?></a>
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('_add_group');?></h4>
				</div>
			</div>
		</div>
		<div class="mg-t-15">
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod);?>'"><i data-feather="arrow-left" class="mr-2"></i><?php echo lang_line('button_back');?></button>
		</div>
	</div>

	<div class="card">
		<?php 
			echo form_open('','id="form_group" autocomplete="off"');
			echo form_hidden('act','add-group');
		?>
		<div class="card-body">
			<div class="form-group">
				<label><?php echo lang_line('_title');?> <span class="text-danger">*</span></label>
				<input id="title" type="text" name="title" class="form-control" />
			</div>
			<div class="form-group mb-0">
				<label><?php echo lang_line('_group');?> <span class="text-danger">*</span></label>
				<input id="group" type="text" name="group" class="form-control" />
			</div>
		</div>
		<div class="card-footer">
			<button type="submit" class="btn btn-lg btn-primary button_submit"><i class="cificon licon-send mr-2"></i><?php echo lang_line('button_submit');?></button>
		</div>
		<?php echo form_close();?>
	</div>
</div>
