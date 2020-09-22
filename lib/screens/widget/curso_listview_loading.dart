import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CursoListViewLoading extends StatelessWidget {
  const CursoListViewLoading({
    Key key,
  }) : super(key: key);

  static const _highLightColor = Color.fromRGBO(64, 75, 96, .4);
  static const _baseColor = Colors.white;
  static const _duration = Duration(milliseconds: 4000);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext ctx, int index) {
        return cardCurso();
      },
    );
  }

  Card cardCurso() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),),),

             child: Shimmer.fromColors(
            highlightColor: _highLightColor,
            baseColor: _baseColor,
            period: _duration,
            child: Container(
              height: 50,
              width: 50,
              color: _highLightColor,
            ),
          ),),
          
          title: Shimmer.fromColors(
            highlightColor: _highLightColor,
            baseColor: _baseColor,
            period: _duration,
            child: Container(
              height: 18,
              width: 40,
              color: _highLightColor,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Shimmer.fromColors(
                    highlightColor: _highLightColor,
                    baseColor: _baseColor,
                    child: LinearProgressIndicator(
                      backgroundColor: _highLightColor,
                      value: (100),
                      valueColor: AlwaysStoppedAnimation(_highLightColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Shimmer.fromColors(
                    highlightColor: _highLightColor,
                    baseColor: _baseColor,
                    period: _duration,
                    child: Container(
                      height: 18,
                      width: 40,
                      color: _highLightColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          trailing: Shimmer.fromColors(
            highlightColor: _highLightColor,
            baseColor: _baseColor,
            period: _duration,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
