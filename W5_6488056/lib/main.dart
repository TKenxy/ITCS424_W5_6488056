import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/HomePage': (context) => HomePage(),
        '/MainPage': (context) => MainPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TitleWidget(),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            DetailWidget(
              image: 'https://www.allrecipes.com/thmb/PpGdlxDdmiMFDo9GnaSmnliaoX8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4507925-spicy-thai-basil-chicken-pad-krapow-gai-photo-by-chef-john-cropped-dc99cdbd3e414da5ae3258a723c00108.jpg',
              description: 'Pad Kra Pao Ingredients:\n'
                  '100 g pork\n'
                  '1 cup holy basil leaves\n'
                  '3 garlic cloves, peeled\n'
                  '3 red chilies\n'
                  '1 tablespoon Oyster Sauce\n'
                  '1 tablespoon Fish Sauce\n'
                  '½ tablespoon sugar\n'
                  '1 tablespoon water\n'
                  '2 tablespoons oil for frying\n'
                  'Instructions\n'
                  '1. Mix water, sugar, fish sauce, and oyster sauce together and set aside. \n'
                  '2. If you have a mortar and pestle, pound garlic and chilies together. Otherwise you can chop them or slice thinly. \n'
                  '3. Heat a non-stick saucepan over high heat and add the oil. When the oil is hot, add chilies and garlic and stir-fry till fragrant, about 10 seconds. \n'
                  '4. Add pork and stir continuously for few minutes. When it is starting to look like cooked, add sauce mix and stir-fry till the sauce coats the meat evenly. If it is too dry, you can add a small splash of water. \n'
                  '5. Add basil leaves and stir-fry for few more seconds until wilted, then turn off the heat immediately. \n'
                  '6. Serve Pad Kra Pao over rice, topped with a Thai-style crispy fried egg. \n'
                  'Finished!!',
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Add functionality here
                print('Button pressed');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              child: Text(
                'Favorite',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            NavBarWidget(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Coach',
            style: TextStyle(color: Colors.yellow,fontSize: 40),
          ),
          TextSpan(
            text: 'Cook',
            style: TextStyle(color: Colors.black,fontSize: 40),
          ),
        ],
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String image;
  final String description;

  DetailWidget({required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Add functionality here
            print('Image tapped');
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class NavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/HomePage');
              },
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/256/25/25694.png',
                width: 50,
                height: 50,
              ),
            ),
            Image.network(
              'https://i.pinimg.com/originals/8b/5c/49/8b5c498ed69a64d629249d9abe4f44a6.png',
              width: 50,
              height: 50,
            ),
            Image.network(
              'https://cdn1.iconfinder.com/data/icons/ui-roundicons/480/circle_location-512.png',
              width: 50,
              height: 50,
            ),
            Image.network(
              'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3250939/bookmark-icon-md.png',
              width: 50,
              height: 50,
            ),
            Image.network(
              'https://static-00.iconduck.com/assets.00/settings-icon-1964x2048-8nigtrtt.png',
              width: 50,
              height: 50,
            ),

          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Coach",
              style: TextStyle(color: Colors.yellow, fontSize: 30),
            ),
            Text(
              "Cook",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  items: <String>['Salad', 'Soup', 'Rice', 'Pork', 'Chicken']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {

                  },
                  hint: Text('Select Category'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                Suggestion(
                  name: "Tom Yam Kung",
                  description:
                  "Tom yam kung, or spicy shrimp soup, is the number one of the top ten Thai dishes loved by foreigners.",
                  url:
                  "https://hot-thai-kitchen.com/wp-content/uploads/2013/03/tom-yum-goong-blog.jpg",
                  boxColor: Colors.yellow,
                ),
                Suggestion(
                  name: "Kaeng Khiao Wan",
                  description:
                  "Ranking second among the ten Thai dishes ordered most frequently by foreigners, a green chicken curry gained an 85% popularity.",
                  url:
                  "https://i.guim.co.uk/img/media/2f18f5a49694c482c1476bc51949e38a07b1c097/86_1686_4662_4662/master/4662.jpg?width=700&quality=85&auto=format&fit=max&s=0410e79f847cf5d3ddfebc5604cdd2f2",
                  boxColor: Colors.yellow,
                ),
                Suggestion(
                  name: "Yam Nua",
                  description:
                  "Ranking seventh in the top ten list of Thai food loved by foreigners, Yam Nua or spicy beef salad is a mouth-watering dish.",
                  url:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyiDay_1xYbI77ug2fxiCGzX4dceQz23HtsvszmUvXQ&",
                  boxColor: Colors.yellow,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/MainPage');
                  },
                  child: SizedBox( // Wrapping GestureDetector with SizedBox
                    child: Suggestion(
                      name: "Phat Kaphrao",
                      description:
                      "Ranking fourth among the ten Thai dishes ordered most frequently by foreigners, Phat Kaphrao can have any kind of meat as its main ingredient.",
                      url:
                      "https://hot-thai-kitchen.com/wp-content/uploads/2022/10/pad-gaprao-beef-sq-2.jpg",
                      boxColor: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          NavBarWidget(),
        ],
      ),
    );
  }
}




class Suggestion extends StatelessWidget {
  Suggestion({
    Key? key,
    required this.name,
    required this.description,
    required this.url,
    required this.boxColor,
  }) : super(key: key);

  final String name;
  final String description;
  final String url;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: boxColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              url,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  this.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
