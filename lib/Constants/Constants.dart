import 'package:flutter/material.dart';

TextStyle sideBarStyleName =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle sideBarStyleEmail = TextStyle(fontSize: 15);
final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg'
];
final List<String> titles = [' Coffee ', ' Gelato ', ' Ice Cream ', 'Brownie'];

final List<String> categoryCardImages = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg'
];

final List<String> itemCategoryName = [
  'Energy',
  'Flavoured',
  'Sparkling',
  'Detox',
  'Baverages',
  'Nature',
  'Alkaline',
  'Hydrogen'
];

final List<String> bestsellerProductsImages = [
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-FrozenGarden.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Sound.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-SimpleMapleWaters.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-LaCroix.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Perrier.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Spindrift.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-JustWater.png.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Waterloo.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Ugly.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Polar.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-FrozenGarden.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Sound.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-SimpleMapleWaters.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-SimpleMapleWaters.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-LaCroix.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Spindrift.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-JustWater.png.png?w=525',
  'https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/04/353353-10-of-the-Best-FlavoredWaterBrands-ProductShot-Polar.png?w=525'
];

final List<String> bestSellerProductNames = [
  'Helios Energy Drink',
  'Mint Flavoured Drink',
  'JalZeera Sparkling Water',
  'Helios-Detox',
  'Helios-Baverages',
  'Helios-Nature Water',
  'Helios Alkaline Water',
  'Helios-Hydrogen Water',
  'Polar seltzer',
  'Helios-Energy Drink',
  'Mint-Flavoured Drink',
  'JalZeera-Sparkling Water',
  'Helios-Detox Water',
  'Helios-Baverages and Water',
  'Helios-Nature drinking Water',
  'Helios-Alkaline Water',
  'Helios Hydrogen Water',
  'Polar seltzer Water'
];
