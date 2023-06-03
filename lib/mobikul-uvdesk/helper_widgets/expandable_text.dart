/*
 *  Webkul Software.
 *  @package  Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html 
 *  @link https://store.webkul.com/license.html
 *
 */
import 'package:flutter/material.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/helper/download_helper.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/models/ticket/ticket_details.dart';

class ExpandableThreadView extends StatefulWidget {
  final String text;
  final List<Attachments> attachmentList;

  const ExpandableThreadView(
      {super.key, required this.text, required this.attachmentList});
  @override
  State<StatefulWidget> createState() {
    return ExpandableThreadViewState();
  }
}

class ExpandableThreadViewState extends State<ExpandableThreadView> {
  bool isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          maxLines: isExpanded ? null : 1,
        ),
        isExpanded && widget.attachmentList.isNotEmpty
            ? SizedBox(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.attachmentList.length,
                    itemBuilder: (context, index) {
                      if (widget.attachmentList[index].iconURL.isNotEmpty) {
                        return Material(
                          child: InkWell(
                            child: Image.network(
                              widget.attachmentList[index].iconURL,
                              height: 60,
                              width: 60,
                            ),
                            onTap: () {
                              DownloadHelper().downloadPersonalData(widget.attachmentList[index].downloadURL,widget.attachmentList[index].name, "", context);
                            },
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              )
            : Container()
      ],
    );
  }
}
