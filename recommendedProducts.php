	<div id="product-tabs-slider" class="scroll-tabs inner-bottom-vs wow fadeInUp">
		<div class="more-info-tab clearfix">
			<h3 class="new-product-title pull-left">Recommended Products</h3>
			<ul class="nav nav-tabs nav-tab-line pull-right" id="new-products-1">
		</div>
		<div class="tab-content outer-top-xs">
			<div class="tab-pane in active" id="all">
				<div class="product-slider">
					<div class="owl-carousel home-owl-carousel custom-carousel owl-theme" data-item="4">
						<?php
						$userId = $_SESSION['id'];
						$sql = "SELECT DISTINCT subCategory FROM orders INNER JOIN products ON orders.productId = products.id WHERE orders.userId = $userId";
						$ret = mysqli_query($con, $sql);
						if (mysqli_num_rows($ret) > 0) {
							while ($row = mysqli_fetch_array($ret)) {
								$subCategory = $row["subCategory"];
								$sql = "SELECT * FROM products WHERE subCategory = $subCategory AND id NOT IN (SELECT productId FROM orders WHERE userId = $userId)";
								$productResult = mysqli_query($con, $sql);
								while ($productRow = mysqli_fetch_array($productResult)) {
						?>
									<div class="item item-carousel">
										<div class="products">

											<div class="product">
												<div class="product-image">
													<div class="image">
														<a href="product-details.php?pid=<?php echo htmlentities($productRow['id']); ?>">
															<img src="admin/productimages/<?php echo htmlentities($productRow['id']); ?>/<?php echo htmlentities($productRow['productImage1']); ?>" data-echo="admin/productimages/<?php echo htmlentities($productRow['id']); ?>/<?php echo htmlentities($productRow['productImage1']); ?>" width="180" height="300" alt=""></a>
													</div><!-- /.image -->


												</div><!-- /.product-image -->


												<div class="product-info text-left">
													<h3 class="name"><a href="product-details.php?pid=<?php echo htmlentities($productRow['id']); ?>"><?php echo htmlentities($productRow['productName']); ?></a></h3>
													<div class="rating rateit-small"></div>
													<div class="description"></div>

													<div class="product-price">
														<span class="price">
															Rs. <?php echo htmlentities($productRow['productPrice']); ?> </span>
														<span class="price-before-discount">Rs.<?php echo htmlentities($productRow['productPriceBeforeDiscount']); ?></span>

													</div><!-- /.product-price -->

												</div><!-- /.product-info -->
												<?php if ($productRow['productAvailability'] == 'In Stock') { ?>
													<div class="action"><a href="index.php?page=product&action=add&id=<?php echo $productRow['id']; ?>" class="lnk btn btn-primary">Add to Cart</a></div>
												<?php } else { ?>
													<div class="action" style="color:red">Out of Stock</div>
												<?php } ?>
											</div><!-- /.product -->

										</div><!-- /.products -->
									</div>
						<?php }
							}
						} ?>
					</div>
				</div>
			</div>
		</div>
	</div>