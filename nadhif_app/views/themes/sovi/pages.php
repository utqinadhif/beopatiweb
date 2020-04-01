<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="col-sm-12 clearfix mb-5 left-content">
	<div class="box-pages">
		<div class="post-head">
			<h4><i class="cificon licon-file-text mr-1"></i> <?php echo $result_pages['title'];?></h4>
		</div>
		<div class="post-inner clearfix">
			<?php if ( post_images($result_pages['picture']) ):?>
			<div class="entry-image">
				<img src="<?php echo post_images($result_pages['picture']);?>" alt="<?php echo $result_pages['title'];?>" style="max-width:500px;display:table;margin:0 auto;"/>
			</div>
			<?php endif ?>
			<div class="entry-content detail-content mt-3 clearfix">
				<?php echo html_entity_decode($result_pages['content']);?>
			</div>
		</div>
	</div>
</div>