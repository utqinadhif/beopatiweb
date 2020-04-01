<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="page-inner">
	<div class="d-sm-flex align-items-center justify-content-between pd-b-20">
		<div class="pageheader pd-t-20 pd-b-0">
			<div class="d-flex justify-content-between">
				<div class="clearfix">
					<div class="breadcrumb pd-0 pd-b-10 mg-0">
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_dashboard');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_contact');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title_reply');?></a>
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('mod_title');?></h4>
				</div>
			</div>
		</div>
	</div>

	<div>
		<?php echo $this->cifire_alert->show($this->mod);?>
	</div>
	
	<div class="card">
		<div class="card-header">
			<button type="button" onclick="location.href='<?php echo admin_url($this->mod);?>'" class="btn btn-white"><i data-feather="inbox" class="wd-16"></i><span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_inbox');?></span></button>

			<button type="button" onclick="location.href='<?php echo admin_url($this->mod.'/outbox');?>'" class="btn btn-white"><i data-feather="external-link" class="wd-16"></i><span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_outbox');?></span></button>

			<button type="button" onclick="location.href='<?php echo admin_url($this->mod.'/write');?>'" class="btn btn-white"><i data-feather="edit-3" class="wd-16"></i><span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_write');?></span></button>

			<button type="button" class="btn btn-primary"><i data-feather="pen-tool" class="wd-16"></i> <span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_reply')?></span></button>
		</div>

		<div>
			<?php echo form_open();?>
			<div class="card-body">
				<div class="row mg-b-20">
					<div class="col-md-6">
						<div class="form-group">
								<label><?php echo lang_line('_to')?> <span class="text-danger">*</span></label>
								<input type="text" class="form-control" value="<?php echo $res_mail['email']?>" disabled>
								<input type="hidden" name="to" class="form-control" value="<?php echo $res_mail['email']?>">
							</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label><?php echo lang_line('_subject')?> <span class="text-danger">*</span></label>
							<input type="text" name="subject" class="form-control" value="<?php echo $res_mail['subject']?>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="form-group">
							<label for="Content"><?php echo lang_line('_message')?> <span class="text-danger">*</span></label>
							<textarea name="message" id="Content" class="form-control" cols="30" rows="10"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<button type="submit" class="btn btn-lg btn-primary mr-2"><i class="cificon licon-send mr-2"></i><?php echo lang_line('button_send');?></button>
			</div>
			<?php echo form_close();?>
		</div>
	</div>
</div>