<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!-- popular, latest -->
<div class="sidebar-widgets clearfix mb-3">
	<ul class="nav nav-tabs nav-justified" id="sidebarTabs" role="tablist">
		<li class="nav-item"><a href="#tabsPopular" class="nav-link active" data-toggle="tab" role="tab" aria-controls="tabsPopular" aria-selected="true"><i class="cificon licon-heart mr-1"></i>Popular</a></li>
		<li class="nav-item"><a href="#tabsLatest" class="nav-link" data-toggle="tab" role="tab" aria-controls="tabsLatest" aria-selected="false"><i class="cificon licon-radio mr-1"></i>Latest</a></li>
	</ul>
	<div class="widget clearfix">
		<div class="tab-content" id="sidebarTabs">
			<!-- tabsPopular -->
			<div class="tab-pane show active" id="tabsPopular" role="tabpanel" aria-labelledby="home-tab">
				<ul class="items">
					<?php 
					$popular_posts = $this->CI->index_model->popular_post('all','5');

					foreach($popular_posts as $popular_post) {
						?>
						<li class="list-item">
							<div class="post-lists">
								<div class="media">
									<div class="image-warper">
										<a href="<?php echo post_url($popular_post['post_seotitle']);?>" title="<?php echo $popular_post['post_title'];?>">
											<img alt="<?php echo $popular_post['post_title'];?>" src="<?php echo post_images($popular_post['post_picture'], 'thumb', TRUE);?>">
										</a>
									</div>
									<div class="media-body post-info-2">
										<h5>
											<a href="<?php echo post_url($popular_post['post_seotitle']);?>" title="<?php echo $popular_post['post_title'];?>"><?php echo $popular_post['post_title'];?></a>
										</h5>
									<!-- meta -->
									<ul class="entry-meta clearfix">
										<li><i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$popular_post['category_seotitle']);?>"><?php echo $popular_post['category_title'];?></a></li>
										<li><?php echo ci_timeago($popular_post['post_datepost'].$popular_post['post_timepost']);?></li>
									</ul>
									<!--/ meta -->
									</div>
								</div>
							</div>
						</li>
						<?php
					}
					?>
				</ul>
			</div>
			<!--/ tabsPopular -->
			<!-- tabsLatest -->
			<div class="tab-pane" id="tabsLatest" role="tabpanel" aria-labelledby="home-tab">
				<ul class="items">
					<?php 
					$latest_posts = $this->CI->index_model->latest_post();
					foreach ($latest_posts as $latest_post) {
						?>
						<li class="list-item">
							<div class="post-lists">
								<div class="media">
									<div class="image-warper">
										<a href="<?php echo post_url($latest_post['post_seotitle']);?>" title="<?php echo $latest_post['post_title'];?>">
											<img alt="<?php echo $latest_post['post_title'];?>" src="<?php echo post_images($latest_post['post_picture'], 'thumb', TRUE);?>">
										</a>
									</div>
									<div class="media-body post-info-2">
										<h5>
											<a href="<?php echo post_url($latest_post['post_seotitle']);?>" title="<?php echo $latest_post['post_title'];?>"><?php echo $latest_post['post_title'];?></a>
										</h5>
									<!-- meta -->
									<ul class="entry-meta clearfix">
										<li><i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$latest_post['category_seotitle']);?>"><?php echo $latest_post['category_title'];?></a></li>
										<li><?php echo ci_timeago($latest_post['post_datepost'].$latest_post['post_timepost']);?></li>
									</ul>
									<!--/ meta -->
									</div>
								</div>
							</div>
						</li>
						<?php
					}
					?>
				</ul>
			</div>
			<!--/ tabsLatest -->
		</div>
	</div>
</div>
<!--/ popular, latest -->
<!-- Categories -->
<div class="sidebar-widgets clearfix mb-3">
	<div class="widget-title">
		<h4 class="tx-capitalize">Categories</h4>
	</div>
	<div class="widget clearfix widget-category">
		<div class="widget-body">
			<ul class="nav nav-pills flex-column">
				<?php
				$sidebar_category = $this->CI->db
					->select('id_category,COUNT(*)')
					->from('t_post')
					->where('active','Y')
					->group_by('id_category')
					->order_by('COUNT(*)','DESC')
					->get()
					->result_array();
				foreach($sidebar_category as $rescount) {
					$row_scategory = $this->CI->db
						->select('id,title,seotitle')
						->where('id',$rescount['id_category'])
						->where('id >','1')
						->where('active','Y')
						->get('t_category')
						->row_array();

					$num_spost = $this->CI->db
						->select('id')
						->where('id_category',$rescount['id_category'])
						->where('active','Y')
						->get('t_post')
						->num_rows();
					
					if(is_null($row_scategory['id']) || $num_spost == 0 ) continue;
					?>
					<li class="nav-item">
						<a href="<?php echo site_url('category/'.$row_scategory['seotitle']);?>" class="nav-link"><?php echo $row_scategory['title'];?> <small class="pull-right"><?php echo $num_spost;?></small></a>
					</li>
					<?php
				}
				?>
			</ul>
		</div>
	</div>
</div>
<!--/ Categories -->
<!-- tags -->
<div class="sidebar-widgets clearfix mb-3">
	<div class="widget-title">
		<h4 class="tx-capitalize">Tags</h4>
	</div>
	<div class="widget clearfix widget-tags">
		<div class="widget-body tagcloud">
			<?php
				$side_tags = $this->CI->db
					->select('
							  t_tag.title, 
							  t_tag.seotitle, 
							  COUNT(t_post.id) AS tag_count
							')
					->from('t_tag')
					->join('t_post', "t_post.tag LIKE CONCAT('%',t_tag.seotitle,'%')", 'LEFT')
					->group_by('t_tag.id')
					->get()
					->result_array();
				foreach($side_tags as $row_stag) {
					if ($row_stag['tag_count'] == 0) continue;
					?>
					<a href="<?php echo site_url('tag/'.$row_stag['seotitle']);?>" class=""><?php echo $row_stag['title'];?></a>
					<?php
				}
			?>
		</div>
	</div>
</div>
<!--/ tags -->
<!-- ADS -->
<div class="sidebar-widgets clearfix mb-3">
	<div class="widget">
		<img src="<?php echo post_images('ads.jpg','',TRUE);?>" style="width:100%;">
	</div>
</div>
<!--/ ADS -->