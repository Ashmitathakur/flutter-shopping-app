part of 'Helpers.dart';

void modalDeleteProduct(
    BuildContext context, String name, String image, String uid) {
  final productBloc = BlocProvider.of<ProductsBloc>(context);

  showDialog(
    context: context,
    barrierColor: Colors.white54,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: Container(
        height: 196,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextFrave(
                        text: 'Awe ',
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                    TextFrave(text: 'Click', fontWeight: FontWeight.w500),
                  ],
                ),
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close))
              ],
            ),
            Divider(),
            SizedBox(height: 10.0),
            TextFrave(text: 'Are you sure?'),
            SizedBox(height: 20.0),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          scale: 7,
                          image: NetworkImage(
                              URLS.BASE_URL + '/uploads/' + image))),
                ),
                SizedBox(width: 10.0),
                TextFrave(
                  text: name,
                  maxLine: 2,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            BtnFrave(
              height: 45,
              color: Colors.red,
              text: 'DELETE',
              fontWeight: FontWeight.bold,
              onPressed: () {
                productBloc.add(OnDeleteProductEvent(uid));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ),
  );
}
