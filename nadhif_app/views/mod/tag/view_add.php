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
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title_add');?></a>
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('mod_title_add');?></h4>
				</div>
			</div>
		</div>
		<div class="mg-t-15">
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod);?>'"><i data-feather="arrow-left" class="mr-2"></i><?php echo lang_line('button_back');?></button>
		</div>
	</div>

	<div>
		<?php echo $this->cifire_alert->show($this->mod);?>
	</div>
	
	<div class="card">
		<?php echo form_open('','id="form_add"');?>
		<div class="card-body">
			<div class="form-group">
				<label><?php echo lang_line('_tags');?> <span class="text-danger">*</span></label>
				<input type="text" name="data" class="form-control input-tags"/>
			</div>
		</div>
		<div class="card-footer">
			<button type="submit" class="btn btn-lg btn-primary mr-2 submit_add"><i class="cificon licon-send mr-2"></i><?php echo lang_line('button_submit');?></button>
		</div>
		<?php echo form_close();?>
	</div>
</div>
