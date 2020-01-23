import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/providers/bottom_bar_provider.dart';
import 'package:my_ids/screens/ids/ids_screen.dart';
import 'package:provider/provider.dart';

class DefaultBottomBarItem {
  IconData iconData;
  String text;
  String routeName;

  DefaultBottomBarItem({
    this.iconData,
    this.text,
    this.routeName,
  });
}

class DefaultBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DefaultBottomBarItem> items = [
      DefaultBottomBarItem(
        routeName: IdsScreen.routeName,
        iconData: Icons.list,
        text: S.of(context).bottomBarIDs,
      ),
      DefaultBottomBarItem(
        routeName: "/profile",
        iconData: Icons.person_outline,
        text: S.of(context).bottomBarProfile,
      ),
    ];
    List<Widget> widgetItems = List.generate(items.length, (int index) {
      return _buildTabItem(
        context: context,
        item: items[index],
        onPressed: (routeName) => Provider.of<BottomBarProvider>(context, listen: false)
            .currentRouteName = routeName,
      );
    });
    widgetItems.insert(widgetItems.length >> 1, _buildMiddleTabItem(context));

    return BottomAppBar(
      color: Colors.white,
      elevation: 6,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgetItems,
      ),
    );
  }

  Widget _buildMiddleTabItem(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: () => print("ADD ID"),
        child: Container(
          width: 40,
          height: 40,
          decoration: new BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 2,
            ),
          ),
          child: new Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    BuildContext context,
    DefaultBottomBarItem item,
    ValueChanged<String> onPressed,
  }) {
    Color color =
    Provider.of<BottomBarProvider>(context).currentRouteName == item.routeName
        ? Theme.of(context).primaryColor
        : Colors.black;
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(item.routeName),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: 24),
                Text(
                  item.text,
                  style: TextStyle(
                    color: color,
                    fontFamily: "Nunito",
                    fontWeight:
                    Provider.of<BottomBarProvider>(context).currentRouteName ==
                        item.routeName
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
