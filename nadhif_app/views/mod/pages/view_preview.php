<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="page-inner mg-b-50">
	<div class="d-sm-flex align-items-center justify-content-between pd-b-20">
		<div class="pageheader pd-t-20 pd-b-0">
			<div class="d-flex justify-content-between">
				<div class="clearfix">
					<div class="breadcrumb pd-0 pd-b-10 mg-0">
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_dashboard');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_content');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title_preview');?></a>
					</div>
					<div class="">
						<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('mod_title_preview');?></h4>
					</div>
				</div>
			</div>
		</div>
		<div class="mg-t-15">
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod);?>'"><i data-feather="arrow-left" class="mr-2"></i><?php echo lang_line('button_back');?></button>
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod.'/edit/?id='.urlencode(encrypt($res['id'])));?>'"><i data-feather="edit" class="mr-2"></i><?php echo lang_line('button_edit');?></button>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-md-9 align-self-center detailpost">
					<h4 class="title mg-t-20 mg-b-20"><?php echo $res['title'];?></h4>
					<?php if (post_images($res['picture'])): ?>					
					<img src="<?php echo post_images($res['picture']);?>" class="pic mg-b-20" />
					<?php endif ?>
					<link rel="stylesheet" href="<?php echo content_url('plugins/prism/prism.css');?>" type="text/css"/>
					<div class="preview-content"><?php echo html_entity_decode($res['content']);?></div>	
				</div>
			</div>
		</div>
	</div>
</div>