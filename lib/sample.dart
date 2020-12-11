import 'dart:convert';

class SampleData {
  static var sampledata = {
    "data": [
      {
        "image_url":
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
        "title": "title 1",
        "type": "header 1"
      },
      {
        "image_url":
            "https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg",
        "title": "title 2",
        "type": "header 1"
      },
      {
        "image_url":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd_CXpBDUwkfibPyNKTfCaFTu7SXFHBMZZPA&usqp=CAU",
        "title": "title 3",
        "type": "header 1"
      },
      {
        "image_url": "https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78",
        "title": "title 4",
        "type": "header 1"
      },
      {
        "image_url":
            "https://i.pinimg.com/originals/83/f9/37/83f937b69f30bb886ab8a03390da6771.jpg",
        "title": "title 5",
        "type": "header 1"
      },
      {
        "image_url":
            "https://images.ctfassets.net/hrltx12pl8hq/6gefxWFu1cp4cECQE6qpRS/15f4228cb3a2265c990dbaf1304ecea2/shutterstock_1469674187.jpg?fit=fill&w=800&h=400",
        "title": "title 6",
        "type": "header 2"
      },
      {
        "image_url":
            "https://images.unsplash.com/photo-1518568740560-333139a27e72?ixlib=rb-1.2.1&w=1000&q=80",
        "title": "title 7",
        "type": "header 2"
      },
      {
        "image_url":
            "https://i.pinimg.com/originals/5d/66/09/5d6609150b338d0f5829814c1f2fa4f9.jpg",
        "title": "title 8",
        "type": "header 2"
      },
      {
        "image_url":
            "https://filedn.com/ltOdFv1aqz1YIFhf4gTY8D7/ingus-info/BLOGS/Photography-stocks3/stock-photography-slider.jpg",
        "title": "title 9",
        "type": "header 2"
      },
      {
        "image_url":
            "https://www.istockphoto.com/resources/images/PhotoFTLP/NatureLandscapes-519760984.jpg",
        "title": "title 10",
        "type": "header 2"
      }
    ]
  };
  static var sampleJson = json.encode(sampledata);

  static void printJson() {
    print(json.decode(sampleJson));
  }
}
