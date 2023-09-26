// ignore_for_file: non_constant_identifier_names

class Coffee {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String type;
  final double rating;
  final double price;
  final String size;
   bool isFavorite;

  Coffee(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.type,
      required this.rating,
      required this.price,
      required this.size,
      required this.isFavorite});
}

final List<Coffee> Popularlist = [
  Coffee(
      name: "Cappuccino",
      description:
          "Cappuccino is a coffee that is made with the most sophisticated ingredients in the world.",
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/3e4f/b239/4a8a3fb8ef5d598235d299b0b15b720d?Expires=1696204800&Signature=CpNY390wo8GU5SPDmzdUHUu7k-jZGhk4i8NvDbVoNdV5EWneQMFYkNC4DhX4LjYwjMASj14c2DMvUzoIX02cEZgXJ5ll38ReyvPOXVRev0-3NzEveYrbT2ysGRV~gKVodk1JWufrrBFdnA6N5KFPCRjOa2CbWAMarPio7WFbjlqkoenX4vb01kS51iMmNBAG~FDP2Hp13wpp7YxuCU~rupEPgi9gBDMkl2Nw~IYcEWJ5QG~9k8wNm8CTjpJgGyHg1i2zmrEjD~Y6qRZsV7bXkXUHvW~tZUURNIMZrRlu54bggaz76Y8RVFR0vi38J04Ru5TOSDwOm3yfvZoh3eD0Lw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      type: "Winter special",
      rating: 4.5,
      price: 10,
      size: "250ml",
      isFavorite: false, id: '1'),
  Coffee(
      name: "ICED AMERICANO",
      type: "Black coffee",
      description:
          "A classic iced Americano made from freshly brewed espresso and chilled water. It's strong and invigorating.",
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/d2e5/2bdc/95dd786610914e225dacaf622e6c5871?Expires=1696204800&Signature=cEVu~sdPtff9zeZkJXzrZfHNUntiOSFNQCRZb0bU53cdjfcsM-UfMGy-YjKJa-DqxgFC3futu2hLAwBrtqNS22uhWrZGyIZOMqAORJQRwqubaCYPa4gtbyvKBtyyPr4~37weuOt907VQk5rKbvL9mvuZfRSBCLslqXvIWh-pMslOVQD5RsxwH1K0gk8CwxeltL6VvTfkR5ziK7UCNDUbfXheNypmtSdNt5Df6jHMHLEPXacsc1WJpmPx6Q9G1ius7TOu00Q~x~ENneZpgyCa1riInPddce0wIJyHB4mphuD59lq8-DInQOZm1y3YDBz~cRoqvaizbbBOBw-yVoVaJA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      rating: 4.5,
      price: 3.99,
      size: "450ml",
      isFavorite: false, id: '2'),
  Coffee(
      name: "SILKY CAFE AU LAIT",
      description:
          "A soothing and creamy decaffeinated coffee with a silky cafe au lait flavor. Perfect for relaxation.",
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/acf1/10ae/adcffc8901359b9b4345b61ac160c51d?Expires=1696204800&Signature=k5ktNQhW1MR2kLFTA8x--dnHArD2PudM~G30VTKjsVHcg68Dq1UMpfXJChurX-G7aqnRYh88tJGTGeUxNpBDm5Z~K-QIwKoNxEdhn8TINiQvhb82MAfp0PjLWtTDF8JJNiBKWrTiCbGwCyH~KCl7aXrOzuyhX7Zs3o4v77ppV~wlXo5qiv7GyslQ0um07gSjQEjudjxZaCEVzH9y58APEEofVcEEcmJooux65SjhUWS7lEtxZSwP2B09Tu~UH1fsJchSIcaWy~oCOL0zittMrY78r9S7DEsuKouJY~YIkOQYhpESy9jwSFmgKl4gEfxaEAp97bp-Bfnu3oh2rXjiQQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      type: "DECAFF",
      rating: 4.2,
      price: 4.49,
      size: "450ml",
      isFavorite: true, id: '3'),
  Coffee(
    name: "Iced Chocolate",
    description:
        "A delightful iced chocolate drink with a rich and chocolatey flavor. It's a perfect treat for chocolate lovers.",
    imageUrl:
        "https://image.freepik.com/free-photo/iced-chocolate_1339-4415.jpg",
    type: "CHOCOLATE",
    rating: 4.7,
    price: 5.99,
    size: '450ml',
    isFavorite: false, id: '4',
  ),
];
final List<Coffee> Blackcoffee = [
  Coffee(
      name: "Drip Coffee ",
      description: "is as simple as the name suggest wherein boiling water drips through ground coffee.",
      imageUrl: "https://images.pexels.com/photos/8004541/pexels-photo-8004541.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      type: "Black coffee",
      rating: 3.5,
      price: 5.8,
      size: "250ml",
      isFavorite: false, id: '5'),
  Coffee(
      name: "ICED AMERICANO",
      type: "Black coffee",
      description:
          "A classic iced Americano made from freshly brewed espresso and chilled water. It's strong and invigorating.",
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/d2e5/2bdc/95dd786610914e225dacaf622e6c5871?Expires=1696204800&Signature=cEVu~sdPtff9zeZkJXzrZfHNUntiOSFNQCRZb0bU53cdjfcsM-UfMGy-YjKJa-DqxgFC3futu2hLAwBrtqNS22uhWrZGyIZOMqAORJQRwqubaCYPa4gtbyvKBtyyPr4~37weuOt907VQk5rKbvL9mvuZfRSBCLslqXvIWh-pMslOVQD5RsxwH1K0gk8CwxeltL6VvTfkR5ziK7UCNDUbfXheNypmtSdNt5Df6jHMHLEPXacsc1WJpmPx6Q9G1ius7TOu00Q~x~ENneZpgyCa1riInPddce0wIJyHB4mphuD59lq8-DInQOZm1y3YDBz~cRoqvaizbbBOBw-yVoVaJA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      rating: 4.5,
      price: 3.99,
      size: "450ml",
      isFavorite: false, id: '2'),
  Coffee(
      name: "Espresso coffee",
      description:
          "originated from Italy, and it is more of a concentrated coffee shot, prepared by pressuring hot water through grounded coffee beans using an espresso machine.",
      imageUrl:"https://images.pexels.com/photos/3988858/pexels-photo-3988858.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" ,

      type: "Black coffee",
      rating: 4.0,
      price: 4.49,
      size: "250ml",
      isFavorite: true, id: '7'),
  Coffee(
    name: "Long Black Coffee ",
    description:
        "Long Black Coffee has a stronger flavor, a higher concentration of espresso and a layer of cream on top.",
    imageUrl:
        "https://images.pexels.com/photos/4065910/pexels-photo-4065910.jpeg?auto=compress&cs=tinysrgb&w=600",
    type: "Black coffee",
    rating: 4.7,
    price: 8.99,
    size: '350ml',
    isFavorite: false, id: '8',
  ),
  Coffee(
    name: "Ristretto coffee",
    description:
    "is known to be a very strong type of coffee. It is prepared from a shot of espresso also known as short black.",
    imageUrl:
    "https://fluentincoffee.com/wp-content/webp-express/webp-images/uploads/2022/05/the-person-holding-ristretto-in-glass.png.webp",
    type: "Black coffee",
    rating: 4.5,
    price: 10.99,
    size: '250ml',
    isFavorite: false, id: '9',
  ),
];
final List<Coffee> Winterspecial = [
  Coffee(
      name: "Peppermint Mocha ",
      description: "A classic winter coffee that combines espresso, steamed milk, chocolate syrup, and peppermint flavoring. It's often topped with whipped cream and crushed candy canes.",
      imageUrl: "https://i.pinimg.com/originals/ff/98/90/ff98903534f90ff1b15113d9b0331cf5.jpg",
      type: "Winter special",
      rating: 4.5,
      price: 10.8,
      size: "450ml",
      isFavorite: false, id: '10'),
  Coffee(
      name: "Gingerbread Latte",
      type: "Winter special",
      description:
      "This coffee features gingerbread syrup, espresso, steamed milk, and a sprinkle of ground ginger or cinnamon.",
      imageUrl: "https://butterandbliss.net/wp-content/uploads/2020/12/Gingerbread-Latte_ButterandBliss-8-of-12.jpg",
      rating: 4.3,
      price: 12.99,
      size: "450ml",
      isFavorite: false, id: '11'),
  Coffee(
      name: "Caramel Brulée Latte",
      description:
      " Made with caramel brulée sauce, espresso, steamed milk, and a caramelized sugar topping, this coffee has a rich and sweet flavor profile.",
      imageUrl:"https://i.pinimg.com/originals/85/42/83/85428368c299f5fd00c3bc6b22d305a7.jpg" ,
      type: "Winter special",
      rating: 4.0,
      price: 4.49,
      size: "250ml",
      isFavorite: true, id: '12'),
  Coffee(
    name: "Toasted Marshmallow Mocha ",
    description:
    "A delightful blend of chocolate, espresso, steamed milk, and toasted marshmallow syrup.",
    imageUrl:
    "https://i1.wp.com/snacksandsips.com/wp-content/uploads/2021/02/00-Toasted-Marshmallow-Mocha-Latte.jpg?fit=680%2C1021&ssl=1",
    type: "Winter special",
    rating: 4.9,
    price: 15.99,
    size: '450ml',
    isFavorite: false, id: '13',
  ),
  Coffee(
      name: "Cappuccino",
      description:
      "Cappuccino is a coffee that is made with the most sophisticated ingredients in the world.",
      imageUrl:
      "https://s3-alpha-sig.figma.com/img/3e4f/b239/4a8a3fb8ef5d598235d299b0b15b720d?Expires=1696204800&Signature=CpNY390wo8GU5SPDmzdUHUu7k-jZGhk4i8NvDbVoNdV5EWneQMFYkNC4DhX4LjYwjMASj14c2DMvUzoIX02cEZgXJ5ll38ReyvPOXVRev0-3NzEveYrbT2ysGRV~gKVodk1JWufrrBFdnA6N5KFPCRjOa2CbWAMarPio7WFbjlqkoenX4vb01kS51iMmNBAG~FDP2Hp13wpp7YxuCU~rupEPgi9gBDMkl2Nw~IYcEWJ5QG~9k8wNm8CTjpJgGyHg1i2zmrEjD~Y6qRZsV7bXkXUHvW~tZUURNIMZrRlu54bggaz76Y8RVFR0vi38J04Ru5TOSDwOm3yfvZoh3eD0Lw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      type: "Winter special",
      rating: 4.5,
      price: 10,
      size: "250ml",
      isFavorite: false, id: '1'),
];
final List<Coffee> Decaffcoffee = [
  Coffee(
      name: "Decaf French Press Coffee ",
      description: " You can prepare decaf coffee using a French press by steeping coarsely ground decaffeinated coffee beans in hot water.",
      imageUrl: "https://www.allrecipes.com/thmb/MBOnQY6tAVagRvd1cWrenuh81-k=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/French-Press-Coffee-OnzegGetty-Images-2000-97838f6e14a54333a3a722fbc61d5e4d.jpg",
      type: "Decaff Coffee",
      rating: 4.1,
      price: 10.8,
      size: "250ml",
      isFavorite: false, id: '15'),
  Coffee(
      name: "SILKY CAFE AU LAIT",
      description:
      "A soothing and creamy decaffeinated coffee with a silky cafe au lait flavor. Perfect for relaxation.",
      imageUrl:
      "https://s3-alpha-sig.figma.com/img/acf1/10ae/adcffc8901359b9b4345b61ac160c51d?Expires=1696204800&Signature=k5ktNQhW1MR2kLFTA8x--dnHArD2PudM~G30VTKjsVHcg68Dq1UMpfXJChurX-G7aqnRYh88tJGTGeUxNpBDm5Z~K-QIwKoNxEdhn8TINiQvhb82MAfp0PjLWtTDF8JJNiBKWrTiCbGwCyH~KCl7aXrOzuyhX7Zs3o4v77ppV~wlXo5qiv7GyslQ0um07gSjQEjudjxZaCEVzH9y58APEEofVcEEcmJooux65SjhUWS7lEtxZSwP2B09Tu~UH1fsJchSIcaWy~oCOL0zittMrY78r9S7DEsuKouJY~YIkOQYhpESy9jwSFmgKl4gEfxaEAp97bp-Bfnu3oh2rXjiQQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      type: "DECAFF",
      rating: 4.2,
      price: 4.49,
      size: "450ml",
      isFavorite: true, id: '3'),

];
final List<Coffee> Chocolate = [
  Coffee(
    name: "Iced Chocolate",
    description:
    "A delightful iced chocolate drink with a rich and chocolatey flavor. It's a perfect treat for chocolate lovers.",
    imageUrl:
    "https://image.freepik.com/free-photo/iced-chocolate_1339-4415.jpg",
    type: "CHOCOLATE",
    rating: 4.7,
    price: 5.99,
    size: '450ml',
    isFavorite: false, id: '4',
  ),
  Coffee(
    name: "Chocolate Cappuccino",
    description:
    " This coffee variant combines the elements of a cappuccino (espresso, steamed milk, and milk foam) with chocolate.",
    imageUrl: "https://i.pinimg.com/originals/93/02/ae/9302aeb6efa0702c7fe5a3246fc107fe.jpg",
    type: "CHOCOLATE",
    rating: 4.9,
    price: 13.99,
    size: '350ml',
    isFavorite: false, id: '18',
  ),
  Coffee(
    name: "Chocolate Macchiato",
    description:
    " A chocolate macchiato is a layered coffee drink that includes espresso, steamed milk, and a drizzle of chocolate.",
    imageUrl: "https://c1.wallpaperflare.com/preview/358/126/508/latte-macchiato-drink-coffee.jpg",
    type: "CHOCOLATE",
    rating: 4.9,
    price: 13.99,
    size: '350ml',
    isFavorite: false, id: '19',
  ),
  Coffee(
    name: "Hot Chocolate Coffee",
    description:
    "Hot chocolate coffee is a delightful fusion of hot chocolate and coffee. You can make it by mixing hot cocoa with brewed coffee. It's creamy, sweet, and perfect for a cozy day.",
    imageUrl: "https://hiroasiankitchen.com/wp-content/uploads/2020/10/word-image-142-1024x1536.jpeg",
    type: "CHOCOLATE",
    rating: 4.4,
    price: 13.99,
    size: '450ml',
    isFavorite: false, id: '20',
  ),
];