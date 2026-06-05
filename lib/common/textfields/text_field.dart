import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:todotask/utils/contsants/colors.dart';

class NewInputCard extends StatefulWidget {
  final double fontsize;
  final double height;
  final bool readOnly;
  final bool formatter;
  final TextEditingController controller;
  final int maxLines;
  final Color colors;
  final String? label;
  final String? keyboardType;
  final bool isBorder;
  final bool showValidator;
  final String? Function(String?)? validator;
  final String? validatorMessage;
  final String title;
  final String? hint;
  final TextInputType? keyType;
  final bool isLink;
  final VoidCallback? ontap;
  final IconData? suffixIcon;
  final Function? onChange;
  final String? errorText;
  final Widget? prefixIcon;
  final TextCapitalization? textCapitalization;
  final bool password;
  final bool direction;
  const NewInputCard({
    this.isBorder = true,
    this.prefixIcon,
    required this.controller,
    this.label,
    this.keyboardType,
    this.hint,
    this.formatter = false,
    this.readOnly = false,
    this.isLink = false,
    this.errorText,
    this.password = false,
    this.direction = false,
    this.showValidator = false,
    required this.title,
    this.validatorMessage,
    this.ontap,
    this.colors = const Color(0xffC3C7C9),
    this.maxLines = 1,
    this.height = 50,
    this.fontsize = 14,
    this.validator,
    this.keyType,
    this.suffixIcon,
    this.onChange,
    this.textCapitalization,
  });

  @override
  State<NewInputCard> createState() => _NewInputCardState();
}

class _NewInputCardState extends State<NewInputCard> {
  bool show = false;
  @override
  void initState() {
    super.initState();
    show = widget.password;
  }

  InputBorder? borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: widget.isBorder
            ? UColors.textPrimary.withOpacity(.5)
            : Colors.transparent,
      ),
    );
  }

  /// ✅ Function for transparent border (keeps rounded corners)
  InputBorder transparentBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text == "null"
        ? widget.controller.text = ""
        : widget.controller.text;

    return widget.direction == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title.isNotEmpty) ...[
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontSize: widget.fontsize.sp,
                    fontWeight: FontWeight.w400,
                    color: UColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              widget.keyboardType == "int"
                  ? Container(
                      alignment: Alignment.center,
                      height: widget.height,

                      // color: widget.colors,
                      // color: Colors.grey.shade200,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: widget.readOnly,
                        maxLines: widget.maxLines,
                        controller: widget.controller,
                        obscureText: show,
                        keyboardType:
                            widget.formatter ? TextInputType.number : null,
                        inputFormatters: widget.formatter
                            ? <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ]
                            : null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: widget.readOnly
                              ? const Color(0xffF2F3F5).withOpacity(.2)
                              : Colors.white,
                          suffixIcon: widget.password
                              ? IconButton(
                                  icon: show
                                      ? const Icon(Icons.visibility, size: 18)
                                      : const Icon(
                                          Icons.visibility_off_outlined,
                                          size: 18,
                                        ),
                                  onPressed: () {
                                    show = !show;
                                    setState(() {});
                                  },
                                )
                              : null,
                          labelStyle: const TextStyle(
                            fontSize: 13,
                            //fontStyle: FontStyle.italic,
                          ),
                          // label: Text(
                          //   widget.label,
                          // ),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          hintText: widget.label,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: const Color(0xff3E4F5B).withOpacity(.1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: const Color(0xff3E4F5B).withOpacity(.1),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Rounded corners
                      ),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textCapitalization: widget.textCapitalization ??
                            TextCapitalization.none,
                        readOnly: widget.readOnly,
                        maxLines: widget.maxLines,
                        controller: widget.controller,
                        onTap: () {
                          // if(widget.ontap!=null){
                          //   widget.ontap!();
                          // }
                        },
                        obscureText: show,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: UColors.textPrimary.withOpacity(.8),
                          fontWeight: FontWeight.w500,
                        ),

                        // TextStyle(
                        //   decoration: TextDecoration.none,
                        //   decorationThickness: 0,
                        //   color: Colors.red,
                        // ),
                        onChanged: (va) {
                          if (widget.onChange != null) {
                            widget.onChange!(va);
                          }
                          //  setState(() {});
                        },
                        validator: widget.showValidator
                            ? widget.validator ??
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return widget.validatorMessage ??
                                        'This is a mandatory field';
                                  }
                                  return null; // Valid input
                                }
                            : null,
                        keyboardType: widget.formatter
                            ? TextInputType.number
                            : widget.keyType,
                        inputFormatters: widget.formatter
                            ? <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ]
                            : null,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: widget.prefixIcon,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 12.0,
                          ),

                          fillColor: widget.readOnly
                              ? const Color(0xffF6F6F6)
                              : Colors.white,
                          suffixIcon: widget.password
                              ? IconButton(
                                  icon: show
                                      ? const Icon(
                                          Icons.visibility,
                                          size: 18,
                                          color: UColors.textPrimary,
                                        )
                                      : const Icon(
                                          Icons.visibility_off_outlined,
                                          size: 18,
                                          color: UColors.textPrimary,
                                        ),
                                  onPressed: () {
                                    show = !show;
                                    setState(() {});
                                  },
                                )
                              : IconButton(
                                  icon: Icon(
                                    widget.suffixIcon,
                                    size: 18,
                                    color: UColors.textPrimary,
                                  ),
                                  onPressed: () {
                                    // show = !show;
                                    // setState(() {});
                                  },
                                ),

                          labelStyle: const TextStyle(
                            fontSize: 13,
                            //fontStyle: FontStyle.italic,
                          ),
                          // label: Text(
                          //   widget.label,
                          // ),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: UColors.textPrimary.withOpacity(.8),
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: widget.label,
                          disabledBorder: widget.readOnly
                              ? transparentBorder()
                              : borderStyle(),
                          enabledBorder: widget.readOnly
                              ? transparentBorder()
                              : borderStyle(),
                          border: widget.readOnly
                              ? transparentBorder()
                              : borderStyle(),
                          focusedBorder: widget.readOnly
                              ? transparentBorder()
                              : borderStyle(),
                        ),
                      ),
                    ),
            ],
          )
        : SizedBox(
            height: 300,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: widget.fontsize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .003),
                SizedBox(
                  height: widget.height,
                  // color: widget.colors,
                  // color: Colors.grey.shade200,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    maxLines: widget.maxLines,
                    controller: widget.controller,
                    obscureText: show,
                    decoration: InputDecoration(
                      suffixIcon: widget.password
                          ? IconButton(
                              icon: show
                                  ? const Icon(Icons.visibility, size: 18)
                                  : const Icon(
                                      Icons.visibility_off_outlined,
                                      size: 18,
                                    ),
                              onPressed: () {
                                show = !show;
                                setState(() {});
                              },
                            )
                          : null,
                      labelStyle: const TextStyle(
                        fontSize: 13,
                        //fontStyle: FontStyle.italic,
                      ),
                      // label: Text(
                      //   widget.label,
                      // ),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      hintText: widget.label,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: widget.colors),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class PopUpDateFormField extends StatefulWidget {
  final String? label;
  final DateTime? initialValue;
  final bool enable;
  final String? hint;
  final bool required;
  final bool row;
  final bool isCreate;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  // final TextEditingController controller;
  final FormFieldSetter<DateTime>? onSaved;
  final DateFormat? format;
  const PopUpDateFormField({
    this.label,
    this.controller,
    this.row = false,
    this.isCreate = false,
    this.enable = true,
    this.required = false,
    this.hint,
    this.onSaved,
    this.format,
    this.initialValue,
    this.focusNode,
  });

  @override
  _PopUpDateFormFieldState createState() => _PopUpDateFormFieldState();
}

class _PopUpDateFormFieldState extends State<PopUpDateFormField> {
  InputBorder? borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: UColors.textPrimary.withOpacity(.5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("date${widget.initialValue}");
    final mFormat = widget.format ?? DateFormat.yMd();
    return widget.row
        ? SizedBox(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                //horizontal: 10,
                vertical: 5,
              ),
              leading: SizedBox(
                width: 70,
                child: Text.rich(
                  TextSpan(
                    text: widget.label,
                    // style:CommonTextStyle.normalHeadingStyle,
                    children: widget.required
                        ? [
                            TextSpan(
                              text: "*",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
              title: SizedBox(
                height: 38,
                child: DateTimeField(
                  initialValue: widget.initialValue,
                  // controller: widget.controller,
                  enabled: widget.enable,
                  validator: (value) => value == null ? "* required" : null,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today_outlined),
                    contentPadding: null,
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: widget.hint ?? 'DD/MM/YYYY',
                    // labelText: widget.initialValue?.toString().split(" ")[0],
                    isDense: true,
                    label: null,
                    alignLabelWithHint: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(
                        color: Color(0xff3E4F5B).withOpacity(.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(
                        color: Color(0xff3E4F5B).withOpacity(.1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff3E4F5B).withOpacity(.001),
                      ),
                    ),
                  ),
                  format: mFormat,
                  style: TextStyle(fontSize: 14),
                  onChanged: widget.onSaved,
                  //  onFieldSubmitted: widget.onSaved,
                  onShowPicker: (context, currentValue) async {
                    DateTime? date;
                    if (widget.enable) {
                      date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: widget.isCreate
                            ? DateTime.now()
                            : currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    }

                    return date ??
                        (widget.isCreate ? DateTime.now() : currentValue);
                  },
                ),
              ),
            ),
          )
        :
        // Padding(
        //     //height: 40,
        //     //  width: context.blockSizeHorizontal * 20,
        //     padding: EdgeInsets.symmetric(
        //         horizontal: MediaQuery.of(context).size.width * .018),
        //     child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.label?.isNotEmpty == true) ...[
                Text(
                  widget.label!,
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: UColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(height: 3),
              ],
              DateTimeField(
                controller: widget.controller,
                // initialValue: widget.initialValue,
                enabled: widget.enable,
                validator: (value) => value == null ? "* required" : null,
                focusNode: widget.focusNode,
                onEditingComplete: () {
                  // Display calendar when Enter key is pressed
                  // showCalendar(context);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  // labelText: widget.initialValue?.toString().split(" ")[0],
                  isDense: true,
                  hintText: "DD/MM/YYYY",
                  hintStyle: TextStyle(fontSize: 14.sp),
                  // label: widget.controller?.text.isNotEmpty == true
                  //     ? Text("")
                  //     : Center(
                  //         child: Text("DD/MM/YYYY",
                  //             style: TextStyle(
                  //                 color: AppColors.hintTextGrey,
                  //                 fontSize: 14.sp)),
                  //       ),
                  alignLabelWithHint: true,
                  enabledBorder: borderStyle(),

                  focusedBorder: borderStyle(),
                  border: borderStyle(),
                ),
                format: mFormat,
                style: TextStyle(fontSize: 17),
                onChanged: widget.onSaved,
                //  onFieldSubmitted: widget.onSaved,
                onShowPicker: (context, currentValue) async {
                  DateTime? date;
                  if (widget.enable) {
                    date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: widget.isCreate
                          ? DateTime.now()
                          : currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                  }

                  return date ??
                      (widget.isCreate ? DateTime.now() : currentValue);
                },
              ),
            ],
            // ),
          );
  }
}
