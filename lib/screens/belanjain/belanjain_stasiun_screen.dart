// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainStasiunScreen extends StatefulWidget {
  const BelanjainStasiunScreen({super.key});

  @override
  State<BelanjainStasiunScreen> createState() => _BelanjainStasiunScreenState();
}

class _BelanjainStasiunScreenState extends State<BelanjainStasiunScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return BelanjainAppbar(
      context: context,
      title: Text(
        'Pilih Stasiun',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
              width: double.infinity,
              // height: 40,
              child: _buildTextfield(),
            ),
            Expanded(
              child: _buildList(),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildCancelButton(),
        ),
      ],
    );
  }

  Widget _buildTextfield() {
    return Row(
      children: [
        Expanded(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFF2F4F5),
            ),
            child: Center(
              child: TextField(
                controller: _controller,
                style: TextStyle(
                  fontSize: 14,
                ),
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {
                    _controller.text = value;
                    _controller.selection = TextSelection.collapsed(
                      offset: _controller.text.length,
                    );
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Transform.scale(
                    scale: .35,
                    child: SvgPicture.asset(IntransporiaImages.search),
                  ),
                  suffixIcon: _controller.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _controller.clear();
                            });
                          },
                          child: Transform.scale(
                            scale: .8,
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : null,
                  hintText: 'Cari stasiun',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        _controller.text.isNotEmpty
            ? Row(
                children: [
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.clear();
                        _focusNode.unfocus();
                      });
                    },
                    child: Text('Cancel'),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 100),
      itemBuilder: (context, index) {
        return _buildItem();
      },
      separatorBuilder: (context, index) {
        return Container();
      },
      itemCount: 20,
    );
  }

  Widget _buildItem() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Text('Nama Stasiun'),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Container(
      // color: Colors.red,
      decoration: BoxDecoration(
        color: Color(0xFFFBFAFF),
        border: Border(
          top: BorderSide(color: Color(0xFFF2F4F5)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(60),
          child: Ink(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Color(0xFFFBFAFF),
            ),
            child: Text(
              'Cancel',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
