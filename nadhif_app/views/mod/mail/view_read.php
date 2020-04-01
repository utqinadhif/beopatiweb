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
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('mod_title');?></h4>
				</div>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			<button type="button" onclick="location.href='<?php echo admin_url($this->mod);?>'" class="btn btn-white"><i data-feather="inbox" class="wd-16"></i><span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_inbox');?></span></button>
			<button type="button" onclick="location.href='<?php echo admin_url($this->mod.'/outbox');?>'" class="btn btn-white"><i data-feather="external-link" class="wd-16"></i><span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_outbox');?></span></button>
			<button type="button" onclick="location.href='<?php echo admin_url($this->mod.'/write');?>'" class="btn btn-white"><i data-feather="edit-3" class="wd-16"></i><span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_write');?></span></button>
			<button type="button" class="btn btn-white" onClick="window.location.href='<?php echo admin_url($this->mod.'/reply/'.$res_mail['id'])?>'"><i data-feather="pen-tool" class="wd-16"></i> <span class="d-none d-lg-inline-block ml-2"><?php echo lang_line('button_reply')?></span></button>
		</div>
		<div class="">
			<div class="card-body">
				<div class="media flex-column flex-md-row">
					<div class="media-body">
						<h4 class="mb-1"><?php echo $res_mail['subject'];?></h4>
						<div class="tx-medium">
							<span class="letter-icon-title font-weight-semibold"><?php echo $res_mail['name'];?></span>
							<span>(<?php echo $res_mail['email'];?>)</span>
						</div>
						<span class="text-muted"><?php echo ci_date($res_mail['date'], 'l, d F Y, h:i A');?></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="overflow-auto mw-100" style="min-height:190px;">
					<?php
						if ($res_mail['box']=='out') {
							echo html_entity_decode($res_mail['message']);
						}else {
							echo $res_mail['message'];
						}
					?>
				</div>
			</div>
		</div>
	</div>
</div>