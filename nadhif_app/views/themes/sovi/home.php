<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="col-lg-8 col-md-12 clearfix mb-5 left-content">
	<div id="headlines" class="carousel slide headlines mb-4" data-ride="carousel">
		<div class="carousel-inner">
			<?php
			$i         = 0;
			$headlines = $this->CI->index_model->get_headline();

			foreach($headlines as $res_headline) {
				$i++;
				$active = ($i == 1 ? 'active' : '');
				?>
				<div class="carousel-item <?php echo $active;?>">
					<a href="<?php echo post_url($res_headline['post_seotitle']);?>" class="img-href">
						<img src="<?php echo post_images($res_headline['picture'],'medium',TRUE)?>" class="d-block w-100" alt="<?php echo $res_headline['post_title']?>">
					</a>					
					<div class="carousel-caption d-md-block">
						<div class="tagcloud">
							<a href="#" rel="tag" class="bg-red"><?php echo $res_headline['category_title'];?></a> &nbsp;
						</div>
						<h5 class="clearfix mb-1"><?php echo $res_headline['post_title'];?></h5>						
						<ul class="entry-meta clearfix mb-2">
							<li><i class="cificon licon-calendar"></i> <?php echo ci_date($res_headline['datepost'], 'l, d F Y');?></li>
						</ul>
					</div>
				</div>
				<?php
			}
			?>
		</div>
		<a class="carousel-control-prev" href="#headlines" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#headlines" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span>
		</a>
	</div>
	<?php
	$homePost1 = $this->CI->index_model->get_category_by('id', 2, 'row');

	if(!empty($homePost1)) {
		?>
		<div class="box-content-1 mb-2">
			<div class="post-head">
				<h4><i class="cificon licon-bookmark text-muted mr-1"></i> <?php echo $homePost1['title'];?></h4>
			</div>
			<div class="post-inner clearfix">
				<div class="row">
					<?php
					$res_post1a = $this->CI->index_model->get_post_lmit_by_category($homePost1['id'], [1])->row_array();

					if(!empty($res_post1a)) {
						?>
						<div class="col-md-6 box-left">
							<div class="image-warper">
								<a href="<?php echo post_url($res_post1a['post_seotitle'])?>" title="<?php echo $res_post1a['post_title'];?>">
									<img class="image_fade" alt="<?php echo $res_post1a['post_title'];?>" src="<?php echo post_images($res_post1a['picture'], 'medium', TRUE);?>">
								</a>
							</div>
							<div class="post-info-1">
								<h5>
									<a href="<?php echo post_url($res_post1a['post_seotitle'])?>" title="<?php echo $res_post1a['post_title'];?>"><?php echo $res_post1a['post_title'];?></a>
								</h5>
							</div>
							<!-- meta -->
							<ul class="entry-meta clearfix">
								<li>
									<i class="cificon licon-calendar"></i> <?php echo ci_date($res_post1a['datepost'].$res_post1a['timepost'], 'l, d F Y');?>
								</li>
								<li>
									<i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$res_post1a['category_seotitle']);?>"><?php echo $res_post1a['category_title'];?></a>
								</li>
							</ul>
							<!--/ meta -->
							<div class="box-content">
								<p><?php echo cut($res_post1a['content'], 90);?>...</p>
							</div>
						</div>
						<div class="col-md-6 box-right">
							<?php
							$post1b = $this->CI->index_model->get_post_lmit_by_category($homePost1['id'], [4,1]);

							foreach($post1b->result_array() as $res_post1b) {
								?>
								<div class="post-lists">
									<div class="media">
										<div class="image-warper">
											<a href="<?php echo post_url($res_post1b['post_seotitle']);?>" title="<?php echo $res_post1b['post_title'];?>">
												<img alt="<?php echo $res_post1b['post_title'];?>" src="<?php echo post_images($res_post1b['picture'], 'thumb', TRUE);?>">
											</a>
										</div>
										<div class="media-body post-info-2">
											<h5>
												<a href="<?php echo post_url($res_post1b['post_seotitle']);?>" title="<?php echo $res_post1b['post_title'];?>"><?php echo $res_post1b['post_title'];?></a>
											</h5>
										<!-- meta -->
										<ul class="entry-meta clearfix">
											<li><i class="cificon licon-calendar"></i> <?php echo ci_date($res_post1b['datepost'].$res_post1b['timepost'], 'd M Y');?></li>
											<li><i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$res_post1b['category_seotitle']);?>"><?php echo $res_post1b['category_title'];?></a></li>
										</ul>
										<!--/ meta -->
										</div>
									</div>
								</div>
								<?php
							}
							?>
						</div>
						<?php
					}
					?>
				</div>
			</div>
		</div>
		<?php
	}

	$homePost2 = $this->CI->index_model->get_category_by('id', 3, 'row');

	if(!empty($homePost2)) {
		?>
		<div class="box-content-2">
			<div class="row">
				<div class="col-md-6">
					<div class="post-head mt-2">
						<h4>
							<i class="cificon licon-bookmark text-muted mr-1"></i> <?php echo $homePost2['title'];?>
						</h4>
					</div>
					<div class="post-inner clearfix">
						<div class="mb-3">
							<?php
							$res_post2a = $this->CI->index_model->get_post_lmit_by_category($homePost2['id'], [1])->row_array();

							if(!empty($res_post2a)) {
								?>
								<div class="box-left">
									<div class="image-warper">
										<a href="<?php echo post_url($res_post2a['post_seotitle'])?>" title="<?php echo $res_post2a['post_title'];?>">
											<img class="image_fade" alt="<?php echo $res_post2a['post_title'];?>" src="<?php echo post_images($res_post2a['picture'], 'medium', TRUE);?>">
										</a>
									</div>
									<div class="post-info-1">
										<h5>
											<a href="<?php echo post_url($res_post2a['post_seotitle'])?>" title="<?php echo $res_post2a['post_title'];?>"><?php echo $res_post2a['post_title'];?></a>
										</h5>
									</div>
									<!-- meta -->
									<ul class="entry-meta clearfix">
										<li><i class="cificon licon-calendar"></i> <?php echo ci_date($res_post2a['datepost'].$res_post2a['timepost'], 'l, d F Y');?></li>
										<li><i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$res_post2a['category_seotitle']);?>"><?php echo $res_post2a['category_title'];?></a></li>
									</ul>
									<!--/ meta -->
								</div>
								<?php
							}
							?>
						</div>
						<div class="row">
							<?php
							$post2b = $this->CI->index_model->get_post_lmit_by_category($homePost2['id'], [2,1]);

							foreach($post2b->result_array() as $res_post2b) {
								?>
								<div class="post-lists">
									<div class="col-sm-12">
										<div class="media">
											<div class="media-body post-info-2">
												<h5>
													<a href="<?php echo post_url($res_post2b['post_seotitle']);?>" title="<?php echo $res_post2b['post_title'];?>"><?php echo $res_post2b['post_title'];?></a>
												</h5>
												<ul class="entry-meta clearfix">
													<li>
														<i class="cificon licon-calendar"></i> <?php echo ci_date($res_post2b['datepost'].$res_post2b['timepost'], 'l, d F Y');?>
													</li>
													<li>
														<i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$res_post2b['category_seotitle']);?>"><?php echo $res_post2b['category_title'];?></a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<?php
							}
							?>
						</div>
					</div>
				</div>
				<?php
				$homePost3 = $this->CI->index_model->get_category_by('id', 4, 'row');

				if(!empty($homePost3)) {
					?>
					<div class="col-md-6">
						<div class="post-head mt-2">
							<h4>
								<i class="cificon licon-bookmark text-muted mr-1"></i> <?php echo $homePost3['title'];?>
							</h4>
						</div>
						<div class="post-inner clearfix">
							<div class="mb-3">
								<?php
								$res_post3a = $this->CI->index_model->get_post_lmit_by_category($homePost3['id'], [1])->row_array();

								if(!empty($res_post3a)) {
									?>
									<div class="box-left">
										<div class="image-warper">
											<a href="<?php echo post_url($res_post3a['post_seotitle'])?>" title="<?php echo $res_post3a['post_title'];?>">
												<img class="image_fade" alt="<?php echo $res_post3a['post_title'];?>" src="<?php echo post_images($res_post3a['picture'], 'medium', TRUE);?>">
											</a>
										</div>
										<div class="post-info-1">
											<h5>
												<a href="<?php echo post_url($res_post3a['post_seotitle'])?>" title="<?php echo $res_post3a['post_title'];?>">
													<?php echo $res_post3a['post_title'];?>
												</a>
											</h5>
										</div>
										<ul class="entry-meta clearfix">
											<li>
												<i class="cificon licon-calendar"></i> <?php echo ci_date($res_post3a['datepost'].$res_post3a['timepost'], 'l, d F Y');?>
											</li>
											<li>
												<i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$res_post3a['category_seotitle']);?>"><?php echo $res_post3a['category_title'];?></a>
											</li>
										</ul>
									</div>
									<?php
								}
								?>
							</div>							
							<div class="row">
								<?php
								$post3b = $this->CI->index_model->get_post_lmit_by_category($homePost3['id'], [2,1]);

								foreach($post3b->result_array() as $res_post3b) {
									?>
									<div class="post-lists">
										<div class="col-sm-12">
											<div class="media">
												<div class="media-body post-info-2">
													<h5>
														<a href="<?php echo post_url($res_post3b['post_seotitle']);?>" title="<?php echo $res_post3b['post_title'];?>"><?php echo $res_post3b['post_title'];?></a>
													</h5>
													<ul class="entry-meta clearfix">
														<li><i class="cificon licon-calendar"></i> <?php echo ci_date($res_post3b['datepost'].$res_post3b['timepost'], 'l, d F Y');?></li>
														<li><i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$res_post3b['category_seotitle']);?>"><?php echo $res_post3b['category_title'];?></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<?php
								}
								?>
							</div>
						</div>
					</div>
					<?php
				}
				?>
			</div>
		</div>
		<?php
	}
	?>
</div>
<!--/ left content -->
<!-- sidebar -->
<div class="col-lg-4 col-md-12 clearfix mb-5 sidebar">
	<?php $this->CI->_layout('sidebar'); ?>
</div>
<!--/ sidebar -->