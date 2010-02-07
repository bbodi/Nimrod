#* cairo - a vector graphics library with display and print output
# *
# * Copyright � 2002 University of Southern California
# * Copyright � 2005 Red Hat, Inc.
# *
# * This library is free software; you can redistribute it and/or
# * modify it either under the terms of the GNU Lesser General Public
# * License version 2.1 as published by the Free Software Foundation
# * (the "LGPL") or, at your option, under the terms of the Mozilla
# * Public License Version 1.1 (the "MPL"). If you do not alter this
# * notice, a recipient may use your version of this file under either
# * the MPL or the LGPL.
# *
# * You should have received a copy of the LGPL along with this library
# * in the file COPYING-LGPL-2.1; if not, write to the Free Software
# * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
# * You should have received a copy of the MPL along with this library
# * in the file COPYING-MPL-1.1
# *
# * The contents of this file are subject to the Mozilla Public License
# * Version 1.1 (the "License"); you may not use this file except in
# * compliance with the License. You may obtain a copy of the License at
# * http://www.mozilla.org/MPL/
# *
# * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY
# * OF ANY KIND, either express or implied. See the LGPL or the MPL for
# * the specific language governing rights and limitations.
# *
# * The Original Code is the cairo graphics library.
# *
# * The Initial Developer of the Original Code is University of Southern
# * California.
# *
# * Contributor(s):
# *	Carl D. Worth <cworth@cworth.org>
# #*
# *  This FreePascal binding generated August 26, 2005
# *  by Jeffrey Pohlmeyer <yetanothergeek@yahoo.com>
#

#
#  - Updated to cairo version 1.4
#  - Grouped OS specific fuctions in separated units
#  - Organized the functions by group and ordered exactly as the c header
#  - Cleared parameter list syntax according to pascal standard
#
#  By Luiz Am�rico Pereira C�mara
#  October 2007
#

when defined(windows): 
  const 
    LIB_CAIRO* = "libcairo-2.dll"
else: 
  const 
    LIB_CAIRO* = "libcairo.so"
type 
  PByte = cstring
  TStatus* = enum 
    STATUS_SUCCESS = 0, STATUS_NO_MEMORY, STATUS_INVALID_RESTORE, 
    STATUS_INVALID_POP_GROUP, STATUS_NO_CURRENT_POINT, STATUS_INVALID_MATRIX, 
    STATUS_INVALID_STATUS, STATUS_NULL_POINTER, STATUS_INVALID_STRING, 
    STATUS_INVALID_PATH_DATA, STATUS_READ_ERROR, STATUS_WRITE_ERROR, 
    STATUS_SURFACE_FINISHED, STATUS_SURFACE_TYPE_MISMATCH, 
    STATUS_PATTERN_TYPE_MISMATCH, STATUS_INVALID_CONTENT, STATUS_INVALID_FORMAT, 
    STATUS_INVALID_VISUAL, STATUS_FILE_NOT_FOUND, STATUS_INVALID_DASH
  TOperator* = enum 
    OPERATOR_CLEAR, OPERATOR_SOURCE, OPERATOR_OVER, OPERATOR_IN, OPERATOR_OUT, 
    OPERATOR_ATOP, OPERATOR_DEST, OPERATOR_DEST_OVER, OPERATOR_DEST_IN, 
    OPERATOR_DEST_OUT, OPERATOR_DEST_ATOP, OPERATOR_XOR, OPERATOR_ADD, 
    OPERATOR_SATURATE
  TAntialias* = enum 
    ANTIALIAS_DEFAULT, ANTIALIAS_NONE, ANTIALIAS_GRAY, ANTIALIAS_SUBPIXEL
  TFillRule* = enum 
    FILL_RULE_WINDING, FILL_RULE_EVEN_ODD
  TLineCap* = enum 
    LINE_CAP_BUTT, LINE_CAP_ROUND, LINE_CAP_SQUARE
  TLineJoin* = enum 
    LINE_JOIN_MITER, LINE_JOIN_ROUND, LINE_JOIN_BEVEL
  TFontSlant* = enum 
    FONT_SLANT_NORMAL, FONT_SLANT_ITALIC, FONT_SLANT_OBLIQUE
  TFontWeight* = enum 
    FONT_WEIGHT_NORMAL, FONT_WEIGHT_BOLD
  TSubpixelOrder* = enum 
    SUBPIXEL_ORDER_DEFAULT, SUBPIXEL_ORDER_RGB, SUBPIXEL_ORDER_BGR, 
    SUBPIXEL_ORDER_VRGB, SUBPIXEL_ORDER_VBGR
  THintStyle* = enum 
    HINT_STYLE_DEFAULT, HINT_STYLE_NONE, HINT_STYLE_SLIGHT, HINT_STYLE_MEDIUM, 
    HINT_STYLE_FULL
  THintMetrics* = enum 
    HINT_METRICS_DEFAULT, HINT_METRICS_OFF, HINT_METRICS_ON
  TPathDataType* = enum 
    PATH_MOVE_TO, PATH_LINE_TO, PATH_CURVE_TO, PATH_CLOSE_PATH
  TContent* = enum 
    CONTENT_COLOR = 0x00001000, CONTENT_ALPHA = 0x00002000, 
    CONTENT_COLOR_ALPHA = 0x00003000
  TFormat* = enum 
    FORMAT_ARGB32, FORMAT_RGB24, FORMAT_A8, FORMAT_A1
  TExtend* = enum 
    EXTEND_NONE, EXTEND_REPEAT, EXTEND_REFLECT, EXTEND_PAD
  TFilter* = enum 
    FILTER_FAST, FILTER_GOOD, FILTER_BEST, FILTER_NEAREST, FILTER_BILINEAR, 
    FILTER_GAUSSIAN
  TFontType* = enum 
    FONT_TYPE_TOY, FONT_TYPE_FT, FONT_TYPE_WIN32, FONT_TYPE_ATSUI
  TPatternType* = enum 
    PATTERN_TYPE_SOLID, PATTERN_TYPE_SURFACE, PATTERN_TYPE_LINEAR, 
    PATTERN_TYPE_RADIAL
  TSurfaceType* = enum 
    SURFACE_TYPE_IMAGE, SURFACE_TYPE_PDF, SURFACE_TYPE_PS, SURFACE_TYPE_XLIB, 
    SURFACE_TYPE_XCB, SURFACE_TYPE_GLITZ, SURFACE_TYPE_QUARTZ, 
    SURFACE_TYPE_WIN32, SURFACE_TYPE_BEOS, SURFACE_TYPE_DIRECTFB, 
    SURFACE_TYPE_SVG, SURFACE_TYPE_OS2
  TSvgVersion* = enum 
    SVG_VERSION_1_1, SVG_VERSION_1_2
  PSurface* = ptr TSurface
  PPCairoSurface* = ptr PSurface
  PCairo* = ptr TCario
  PPattern* = ptr TPattern
  PFontOptions* = ptr TFontOptions
  PFontFace* = ptr TFontFace
  PScaledFont* = ptr TScaledFont
  PBool* = ptr TBool
  TBool* = int32
  PMatrix* = ptr TMatrix
  PUserDataKey* = ptr TUserDataKey
  PGlyph* = ptr TGlyph
  PTextExtents* = ptr TTextExtents
  PFontExtents* = ptr TFontExtents
  PPathDataType* = ptr TPathDataType
  PPathData* = ptr TPathData
  PPath* = ptr TPath
  PRectangle* = ptr TRectangle
  PRectangleList* = ptr TRectangleList
  TDestroyFunc* = proc (data: Pointer){.cdecl.}
  TWriteFunc* = proc (closure: Pointer, data: PByte, len: int32): TStatus{.cdecl.}
  TReadFunc* = proc (closure: Pointer, data: PByte, len: int32): TStatus{.cdecl.}
  TCario*{.final.} = object        #OPAQUE
  TSurface*{.final.} = object  #OPAQUE
  TPattern*{.final.} = object  #OPAQUE
  TScaledFont*{.final.} = object  #OPAQUE
  TFontFace*{.final.} = object  #OPAQUE
  TFontOptions*{.final.} = object  #OPAQUE
  TMatrix*{.final.} = object 
    xx: float64
    yx: float64
    xy: float64
    yy: float64
    x0: float64
    y0: float64

  TUserDataKey*{.final.} = object 
    unused: int32

  TGlyph*{.final.} = object 
    index: int32
    x: float64
    y: float64

  TTextExtents*{.final.} = object 
    x_bearing: float64
    y_bearing: float64
    width: float64
    height: float64
    x_advance: float64
    y_advance: float64

  TFontExtents*{.final.} = object 
    ascent: float64
    descent: float64
    height: float64
    max_x_advance: float64
    max_y_advance: float64

  TPathData*{.final.} = object  #* _type : TCairoPathDataType;
                                #       length : LongInt;
                                #    end
    x: float64
    y: float64

  TPath*{.final.} = object 
    status: TStatus
    data: PPathData
    num_data: int32

  TRectangle*{.final.} = object 
    x, y, width, height: float64

  TRectangleList*{.final.} = object 
    status: TStatus
    rectangles: PRectangle
    num_rectangles: int32


proc version*(): int32{.cdecl, importc: "cairo_version", dynlib: LIB_CAIRO.}
proc version_string*(): cstring{.cdecl, importc: "cairo_version_string", 
                                 dynlib: LIB_CAIRO.}
  #Helper function to retrieve decoded version
proc version*(major, minor, micro: var int32)
  #* Functions for manipulating state objects
proc create*(target: PSurface): PCairo{.cdecl, importc: "cairo_create", 
                                   dynlib: LIB_CAIRO.}
proc reference*(cr: PCairo): PCairo{.cdecl, importc: "cairo_reference", dynlib: LIB_CAIRO.}
proc destroy*(cr: PCairo){.cdecl, importc: "cairo_destroy", dynlib: LIB_CAIRO.}
proc get_reference_count*(cr: PCairo): int32{.cdecl, 
    importc: "cairo_get_reference_count", dynlib: LIB_CAIRO.}
proc get_user_data*(cr: PCairo, key: PUserDataKey): pointer{.cdecl, 
    importc: "cairo_get_user_data", dynlib: LIB_CAIRO.}
proc set_user_data*(cr: PCairo, key: PUserDataKey, user_data: Pointer, 
                    destroy: TDestroyFunc): TStatus{.cdecl, 
    importc: "cairo_set_user_data", dynlib: LIB_CAIRO.}
proc save*(cr: PCairo){.cdecl, importc: "cairo_save", dynlib: LIB_CAIRO.}
proc restore*(cr: PCairo){.cdecl, importc: "cairo_restore", dynlib: LIB_CAIRO.}
proc push_group*(cr: PCairo){.cdecl, importc: "cairo_push_group", dynlib: LIB_CAIRO.}
proc push_group_with_content*(cr: PCairo, content: TContent){.cdecl, 
    importc: "cairo_push_group_with_content", dynlib: LIB_CAIRO.}
proc pop_group*(cr: PCairo): PPattern{.cdecl, importc: "cairo_pop_group", 
                                  dynlib: LIB_CAIRO.}
proc pop_group_to_source*(cr: PCairo){.cdecl, importc: "cairo_pop_group_to_source", 
                                  dynlib: LIB_CAIRO.}
  #* Modify state
proc set_operator*(cr: PCairo, op: TOperator){.cdecl, importc: "cairo_set_operator", 
    dynlib: LIB_CAIRO.}
proc set_source*(cr: PCairo, source: PPattern){.cdecl, importc: "cairo_set_source", 
    dynlib: LIB_CAIRO.}
proc set_source_rgb*(cr: PCairo, red, green, blue: float64){.cdecl, 
    importc: "cairo_set_source_rgb", dynlib: LIB_CAIRO.}
proc set_source_rgba*(cr: PCairo, red, green, blue, alpha: float64){.cdecl, 
    importc: "cairo_set_source_rgba", dynlib: LIB_CAIRO.}
proc set_source_surface*(cr: PCairo, surface: PSurface, x, y: float64){.cdecl, 
    importc: "cairo_set_source_surface", dynlib: LIB_CAIRO.}
proc set_tolerance*(cr: PCairo, tolerance: float64){.cdecl, 
    importc: "cairo_set_tolerance", dynlib: LIB_CAIRO.}
proc set_antialias*(cr: PCairo, antialias: TAntialias){.cdecl, 
    importc: "cairo_set_antialias", dynlib: LIB_CAIRO.}
proc set_fill_rule*(cr: PCairo, fill_rule: TFillRule){.cdecl, 
    importc: "cairo_set_fill_rule", dynlib: LIB_CAIRO.}
proc set_line_width*(cr: PCairo, width: float64){.cdecl, 
    importc: "cairo_set_line_width", dynlib: LIB_CAIRO.}
proc set_line_cap*(cr: PCairo, line_cap: TLineCap){.cdecl, 
    importc: "cairo_set_line_cap", dynlib: LIB_CAIRO.}
proc set_line_join*(cr: PCairo, line_join: TLineJoin){.cdecl, 
    importc: "cairo_set_line_join", dynlib: LIB_CAIRO.}
proc set_dash*(cr: PCairo, dashes: openarray[float64], offset: float64){.cdecl, 
    importc: "cairo_set_dash", dynlib: LIB_CAIRO.}
proc set_miter_limit*(cr: PCairo, limit: float64){.cdecl, 
    importc: "cairo_set_miter_limit", dynlib: LIB_CAIRO.}
proc translate*(cr: PCairo, tx, ty: float64){.cdecl, importc: "cairo_translate", 
    dynlib: LIB_CAIRO.}
proc scale*(cr: PCairo, sx, sy: float64){.cdecl, importc: "cairo_scale", 
                                     dynlib: LIB_CAIRO.}
proc rotate*(cr: PCairo, angle: float64){.cdecl, importc: "cairo_rotate", 
                                     dynlib: LIB_CAIRO.}
proc transform*(cr: PCairo, matrix: PMatrix){.cdecl, importc: "cairo_transform", 
    dynlib: LIB_CAIRO.}
proc set_matrix*(cr: PCairo, matrix: PMatrix){.cdecl, importc: "cairo_set_matrix", 
    dynlib: LIB_CAIRO.}
proc identity_matrix*(cr: PCairo){.cdecl, importc: "cairo_identity_matrix", 
                              dynlib: LIB_CAIRO.}
proc user_to_device*(cr: PCairo, x, y: var float64){.cdecl, 
    importc: "cairo_user_to_device", dynlib: LIB_CAIRO.}
proc user_to_device_distance*(cr: PCairo, dx, dy: var float64){.cdecl, 
    importc: "cairo_user_to_device_distance", dynlib: LIB_CAIRO.}
proc device_to_user*(cr: PCairo, x, y: var float64){.cdecl, 
    importc: "cairo_device_to_user", dynlib: LIB_CAIRO.}
proc device_to_user_distance*(cr: PCairo, dx, dy: var float64){.cdecl, 
    importc: "cairo_device_to_user_distance", dynlib: LIB_CAIRO.}
  #* Path creation functions
proc new_path*(cr: PCairo){.cdecl, importc: "cairo_new_path", dynlib: LIB_CAIRO.}
proc move_to*(cr: PCairo, x, y: float64){.cdecl, importc: "cairo_move_to", 
                                     dynlib: LIB_CAIRO.}
proc new_sub_path*(cr: PCairo){.cdecl, importc: "cairo_new_sub_path", 
                           dynlib: LIB_CAIRO.}
proc line_to*(cr: PCairo, x, y: float64){.cdecl, importc: "cairo_line_to", 
                                     dynlib: LIB_CAIRO.}
proc curve_to*(cr: PCairo, x1, y1, x2, y2, x3, y3: float64){.cdecl, 
    importc: "cairo_curve_to", dynlib: LIB_CAIRO.}
proc arc*(cr: PCairo, xc, yc, radius, angle1, angle2: float64){.cdecl, 
    importc: "cairo_arc", dynlib: LIB_CAIRO.}
proc arc_negative*(cr: PCairo, xc, yc, radius, angle1, angle2: float64){.cdecl, 
    importc: "cairo_arc_negative", dynlib: LIB_CAIRO.}
proc rel_move_to*(cr: PCairo, dx, dy: float64){.cdecl, importc: "cairo_rel_move_to", 
    dynlib: LIB_CAIRO.}
proc rel_line_to*(cr: PCairo, dx, dy: float64){.cdecl, importc: "cairo_rel_line_to", 
    dynlib: LIB_CAIRO.}
proc rel_curve_to*(cr: PCairo, dx1, dy1, dx2, dy2, dx3, dy3: float64){.cdecl, 
    importc: "cairo_rel_curve_to", dynlib: LIB_CAIRO.}
proc rectangle*(cr: PCairo, x, y, width, height: float64){.cdecl, 
    importc: "cairo_rectangle", dynlib: LIB_CAIRO.}
proc close_path*(cr: PCairo){.cdecl, importc: "cairo_close_path", dynlib: LIB_CAIRO.}
  #* Painting functions
proc paint*(cr: PCairo){.cdecl, importc: "cairo_paint", dynlib: LIB_CAIRO.}
proc paint_with_alpha*(cr: PCairo, alpha: float64){.cdecl, 
    importc: "cairo_paint_with_alpha", dynlib: LIB_CAIRO.}
proc mask*(cr: PCairo, pattern: PPattern){.cdecl, importc: "cairo_mask", 
                                      dynlib: LIB_CAIRO.}
proc mask_surface*(cr: PCairo, surface: PSurface, surface_x, surface_y: float64){.
    cdecl, importc: "cairo_mask_surface", dynlib: LIB_CAIRO.}
proc stroke*(cr: PCairo){.cdecl, importc: "cairo_stroke", dynlib: LIB_CAIRO.}
proc stroke_preserve*(cr: PCairo){.cdecl, importc: "cairo_stroke_preserve", 
                              dynlib: LIB_CAIRO.}
proc fill*(cr: PCairo){.cdecl, importc: "cairo_fill", dynlib: LIB_CAIRO.}
proc fill_preserve*(cr: PCairo){.cdecl, importc: "cairo_fill_preserve", 
                            dynlib: LIB_CAIRO.}
proc copy_page*(cr: PCairo){.cdecl, importc: "cairo_copy_page", dynlib: LIB_CAIRO.}
proc show_page*(cr: PCairo){.cdecl, importc: "cairo_show_page", dynlib: LIB_CAIRO.}
  #* Insideness testing
proc in_stroke*(cr: PCairo, x, y: float64): TBool{.cdecl, importc: "cairo_in_stroke", 
    dynlib: LIB_CAIRO.}
proc in_fill*(cr: PCairo, x, y: float64): TBool{.cdecl, importc: "cairo_in_fill", 
    dynlib: LIB_CAIRO.}
  #* Rectangular extents
proc stroke_extents*(cr: PCairo, x1, y1, x2, y2: var float64){.cdecl, 
    importc: "cairo_stroke_extents", dynlib: LIB_CAIRO.}
proc fill_extents*(cr: PCairo, x1, y1, x2, y2: var float64){.cdecl, 
    importc: "cairo_fill_extents", dynlib: LIB_CAIRO.}
  #* Clipping
proc reset_clip*(cr: PCairo){.cdecl, importc: "cairo_reset_clip", dynlib: LIB_CAIRO.}
proc clip*(cr: PCairo){.cdecl, importc: "cairo_clip", dynlib: LIB_CAIRO.}
proc clip_preserve*(cr: PCairo){.cdecl, importc: "cairo_clip_preserve", 
                            dynlib: LIB_CAIRO.}
proc clip_extents*(cr: PCairo, x1, y1, x2, y2: var float64){.cdecl, 
    importc: "cairo_clip_extents", dynlib: LIB_CAIRO.}
proc copy_clip_rectangle_list*(cr: PCairo): PRectangleList{.cdecl, 
    importc: "cairo_copy_clip_rectangle_list", dynlib: LIB_CAIRO.}
proc rectangle_list_destroy*(rectangle_list: PRectangleList){.cdecl, 
    importc: "cairo_rectangle_list_destroy", dynlib: LIB_CAIRO.}
  #* Font/Text functions
proc font_options_create*(): PFontOptions{.cdecl, 
    importc: "cairo_font_options_create", dynlib: LIB_CAIRO.}
proc font_options_copy*(original: PFontOptions): PFontOptions{.cdecl, 
    importc: "cairo_font_options_copy", dynlib: LIB_CAIRO.}
proc font_options_destroy*(options: PFontOptions){.cdecl, 
    importc: "cairo_font_options_destroy", dynlib: LIB_CAIRO.}
proc font_options_status*(options: PFontOptions): TStatus{.cdecl, 
    importc: "cairo_font_options_status", dynlib: LIB_CAIRO.}
proc font_options_merge*(options, other: PFontOptions){.cdecl, 
    importc: "cairo_font_options_merge", dynlib: LIB_CAIRO.}
proc font_options_equal*(options, other: PFontOptions): TBool{.cdecl, 
    importc: "cairo_font_options_equal", dynlib: LIB_CAIRO.}
proc font_options_hash*(options: PFontOptions): int32{.cdecl, 
    importc: "cairo_font_options_hash", dynlib: LIB_CAIRO.}
proc font_options_set_antialias*(options: PFontOptions, antialias: TAntialias){.
    cdecl, importc: "cairo_font_options_set_antialias", dynlib: LIB_CAIRO.}
proc font_options_get_antialias*(options: PFontOptions): TAntialias{.cdecl, 
    importc: "cairo_font_options_get_antialias", dynlib: LIB_CAIRO.}
proc font_options_set_subpixel_order*(options: PFontOptions, 
                                      subpixel_order: TSubpixelOrder){.cdecl, 
    importc: "cairo_font_options_set_subpixel_order", dynlib: LIB_CAIRO.}
proc font_options_get_subpixel_order*(options: PFontOptions): TSubpixelOrder{.
    cdecl, importc: "cairo_font_options_get_subpixel_order", dynlib: LIB_CAIRO.}
proc font_options_set_hint_style*(options: PFontOptions, hint_style: THintStyle){.
    cdecl, importc: "cairo_font_options_set_hint_style", dynlib: LIB_CAIRO.}
proc font_options_get_hint_style*(options: PFontOptions): THintStyle{.cdecl, 
    importc: "cairo_font_options_get_hint_style", dynlib: LIB_CAIRO.}
proc font_options_set_hint_metrics*(options: PFontOptions, 
                                    hint_metrics: THintMetrics){.cdecl, 
    importc: "cairo_font_options_set_hint_metrics", dynlib: LIB_CAIRO.}
proc font_options_get_hint_metrics*(options: PFontOptions): THintMetrics{.cdecl, 
    importc: "cairo_font_options_get_hint_metrics", dynlib: LIB_CAIRO.}
  #* This interface is for dealing with text as text, not caring about the
  #   font object inside the the TCairo.
proc select_font_face*(cr: PCairo, family: cstring, slant: TFontSlant, 
                       weight: TFontWeight){.cdecl, 
    importc: "cairo_select_font_face", dynlib: LIB_CAIRO.}
proc set_font_size*(cr: PCairo, size: float64){.cdecl, 
    importc: "cairo_set_font_size", dynlib: LIB_CAIRO.}
proc set_font_matrix*(cr: PCairo, matrix: PMatrix){.cdecl, 
    importc: "cairo_set_font_matrix", dynlib: LIB_CAIRO.}
proc get_font_matrix*(cr: PCairo, matrix: PMatrix){.cdecl, 
    importc: "cairo_get_font_matrix", dynlib: LIB_CAIRO.}
proc set_font_options*(cr: PCairo, options: PFontOptions){.cdecl, 
    importc: "cairo_set_font_options", dynlib: LIB_CAIRO.}
proc get_font_options*(cr: PCairo, options: PFontOptions){.cdecl, 
    importc: "cairo_get_font_options", dynlib: LIB_CAIRO.}
proc set_font_face*(cr: PCairo, font_face: PFontFace){.cdecl, 
    importc: "cairo_set_font_face", dynlib: LIB_CAIRO.}
proc get_font_face*(cr: PCairo): PFontFace{.cdecl, importc: "cairo_get_font_face", 
                                       dynlib: LIB_CAIRO.}
proc set_scaled_font*(cr: PCairo, scaled_font: PScaledFont){.cdecl, 
    importc: "cairo_set_scaled_font", dynlib: LIB_CAIRO.}
proc get_scaled_font*(cr: PCairo): PScaledFont{.cdecl, 
    importc: "cairo_get_scaled_font", dynlib: LIB_CAIRO.}
proc show_text*(cr: PCairo, utf8: cstring){.cdecl, importc: "cairo_show_text", 
                                       dynlib: LIB_CAIRO.}
proc show_glyphs*(cr: PCairo, glyphs: PGlyph, num_glyphs: int32){.cdecl, 
    importc: "cairo_show_glyphs", dynlib: LIB_CAIRO.}
proc text_path*(cr: PCairo, utf8: cstring){.cdecl, importc: "cairo_text_path", 
                                       dynlib: LIB_CAIRO.}
proc glyph_path*(cr: PCairo, glyphs: PGlyph, num_glyphs: int32){.cdecl, 
    importc: "cairo_glyph_path", dynlib: LIB_CAIRO.}
proc text_extents*(cr: PCairo, utf8: cstring, extents: PTextExtents){.cdecl, 
    importc: "cairo_text_extents", dynlib: LIB_CAIRO.}
proc glyph_extents*(cr: PCairo, glyphs: PGlyph, num_glyphs: int32, 
                    extents: PTextExtents){.cdecl, 
    importc: "cairo_glyph_extents", dynlib: LIB_CAIRO.}
proc font_extents*(cr: PCairo, extents: PFontExtents){.cdecl, 
    importc: "cairo_font_extents", dynlib: LIB_CAIRO.}
  #* Generic identifier for a font style
proc font_face_reference*(font_face: PFontFace): PFontFace{.cdecl, 
    importc: "cairo_font_face_reference", dynlib: LIB_CAIRO.}
proc font_face_destroy*(font_face: PFontFace){.cdecl, 
    importc: "cairo_font_face_destroy", dynlib: LIB_CAIRO.}
proc font_face_get_reference_count*(font_face: PFontFace): int32{.cdecl, 
    importc: "cairo_font_face_get_reference_count", dynlib: LIB_CAIRO.}
proc font_face_status*(font_face: PFontFace): TStatus{.cdecl, 
    importc: "cairo_font_face_status", dynlib: LIB_CAIRO.}
proc font_face_get_type*(font_face: PFontFace): TFontType{.cdecl, 
    importc: "cairo_font_face_get_type", dynlib: LIB_CAIRO.}
proc font_face_get_user_data*(font_face: PFontFace, key: PUserDataKey): pointer{.
    cdecl, importc: "cairo_font_face_get_user_data", dynlib: LIB_CAIRO.}
proc font_face_set_user_data*(font_face: PFontFace, key: PUserDataKey, 
                              user_data: pointer, destroy: TDestroyFunc): TStatus{.
    cdecl, importc: "cairo_font_face_set_user_data", dynlib: LIB_CAIRO.}
  #* Portable interface to general font features
proc scaled_font_create*(font_face: PFontFace, font_matrix: PMatrix, 
                         ctm: PMatrix, options: PFontOptions): PScaledFont{.
    cdecl, importc: "cairo_scaled_font_create", dynlib: LIB_CAIRO.}
proc scaled_font_reference*(scaled_font: PScaledFont): PScaledFont{.cdecl, 
    importc: "cairo_scaled_font_reference", dynlib: LIB_CAIRO.}
proc scaled_font_destroy*(scaled_font: PScaledFont){.cdecl, 
    importc: "cairo_scaled_font_destroy", dynlib: LIB_CAIRO.}
proc scaled_font_get_reference_count*(scaled_font: PScaledFont): int32{.cdecl, 
    importc: "cairo_scaled_font_get_reference_count", dynlib: LIB_CAIRO.}
proc scaled_font_status*(scaled_font: PScaledFont): TStatus{.cdecl, 
    importc: "cairo_scaled_font_status", dynlib: LIB_CAIRO.}
proc scaled_font_get_type*(scaled_font: PScaledFont): TFontType{.cdecl, 
    importc: "cairo_scaled_font_get_type", dynlib: LIB_CAIRO.}
proc scaled_font_get_user_data*(scaled_font: PScaledFont, key: PUserDataKey): Pointer{.
    cdecl, importc: "cairo_scaled_font_get_user_data", dynlib: LIB_CAIRO.}
proc scaled_font_set_user_data*(scaled_font: PScaledFont, key: PUserDataKey, 
                                user_data: Pointer, destroy: TDestroyFunc): TStatus{.
    cdecl, importc: "cairo_scaled_font_set_user_data", dynlib: LIB_CAIRO.}
proc scaled_font_extents*(scaled_font: PScaledFont, extents: PFontExtents){.
    cdecl, importc: "cairo_scaled_font_extents", dynlib: LIB_CAIRO.}
proc scaled_font_text_extents*(scaled_font: PScaledFont, utf8: cstring, 
                               extents: PTextExtents){.cdecl, 
    importc: "cairo_scaled_font_text_extents", dynlib: LIB_CAIRO.}
proc scaled_font_glyph_extents*(scaled_font: PScaledFont, glyphs: PGlyph, 
                                num_glyphs: int32, extents: PTextExtents){.
    cdecl, importc: "cairo_scaled_font_glyph_extents", dynlib: LIB_CAIRO.}
proc scaled_font_get_font_face*(scaled_font: PScaledFont): PFontFace{.cdecl, 
    importc: "cairo_scaled_font_get_font_face", dynlib: LIB_CAIRO.}
proc scaled_font_get_font_matrix*(scaled_font: PScaledFont, font_matrix: PMatrix){.
    cdecl, importc: "cairo_scaled_font_get_font_matrix", dynlib: LIB_CAIRO.}
proc scaled_font_get_ctm*(scaled_font: PScaledFont, ctm: PMatrix){.cdecl, 
    importc: "cairo_scaled_font_get_ctm", dynlib: LIB_CAIRO.}
proc scaled_font_get_font_options*(scaled_font: PScaledFont, 
                                   options: PFontOptions){.cdecl, 
    importc: "cairo_scaled_font_get_font_options", dynlib: LIB_CAIRO.}
  #* Query functions
proc get_operator*(cr: PCairo): TOperator{.cdecl, importc: "cairo_get_operator", 
                                      dynlib: LIB_CAIRO.}
proc get_source*(cr: PCairo): PPattern{.cdecl, importc: "cairo_get_source", 
                                   dynlib: LIB_CAIRO.}
proc get_tolerance*(cr: PCairo): float64{.cdecl, importc: "cairo_get_tolerance", 
                                     dynlib: LIB_CAIRO.}
proc get_antialias*(cr: PCairo): TAntialias{.cdecl, importc: "cairo_get_antialias", 
                                        dynlib: LIB_CAIRO.}
proc get_current_point*(cr: PCairo, x, y: var float64){.cdecl, 
    importc: "cairo_get_current_point", dynlib: LIB_CAIRO.}
proc get_fill_rule*(cr: PCairo): TFillRule{.cdecl, importc: "cairo_get_fill_rule", 
                                       dynlib: LIB_CAIRO.}
proc get_line_width*(cr: PCairo): float64{.cdecl, importc: "cairo_get_line_width", 
                                      dynlib: LIB_CAIRO.}
proc get_line_cap*(cr: PCairo): TLineCap{.cdecl, importc: "cairo_get_line_cap", 
                                     dynlib: LIB_CAIRO.}
proc get_line_join*(cr: PCairo): TLineJoin{.cdecl, importc: "cairo_get_line_join", 
                                       dynlib: LIB_CAIRO.}
proc get_miter_limit*(cr: PCairo): float64{.cdecl, importc: "cairo_get_miter_limit", 
                                       dynlib: LIB_CAIRO.}
proc get_dash_count*(cr: PCairo): int32{.cdecl, importc: "cairo_get_dash_count", 
                                    dynlib: LIB_CAIRO.}
proc get_dash*(cr: PCairo, dashes, offset: var float64){.cdecl, 
    importc: "cairo_get_dash", dynlib: LIB_CAIRO.}
proc get_matrix*(cr: PCairo, matrix: PMatrix){.cdecl, importc: "cairo_get_matrix", 
    dynlib: LIB_CAIRO.}
proc get_target*(cr: PCairo): PSurface{.cdecl, importc: "cairo_get_target", 
                                   dynlib: LIB_CAIRO.}
proc get_group_target*(cr: PCairo): PSurface{.cdecl, 
    importc: "cairo_get_group_target", dynlib: LIB_CAIRO.}
proc copy_path*(cr: PCairo): PPath{.cdecl, importc: "cairo_copy_path", 
                               dynlib: LIB_CAIRO.}
proc copy_path_flat*(cr: PCairo): PPath{.cdecl, importc: "cairo_copy_path_flat", 
                                    dynlib: LIB_CAIRO.}
proc append_path*(cr: PCairo, path: PPath){.cdecl, importc: "cairo_append_path", 
                                       dynlib: LIB_CAIRO.}
proc path_destroy*(path: PPath){.cdecl, importc: "cairo_path_destroy", 
                                 dynlib: LIB_CAIRO.}
  #* Error status queries
proc status*(cr: PCairo): TStatus{.cdecl, importc: "cairo_status", dynlib: LIB_CAIRO.}
proc status_to_string*(status: TStatus): cstring{.cdecl, 
    importc: "cairo_status_to_string", dynlib: LIB_CAIRO.}
  #* Surface manipulation
proc surface_create_similar*(other: PSurface, content: TContent, 
                             width, height: int32): PSurface{.cdecl, 
    importc: "cairo_surface_create_similar", dynlib: LIB_CAIRO.}
proc surface_reference*(surface: PSurface): PSurface{.cdecl, 
    importc: "cairo_surface_reference", dynlib: LIB_CAIRO.}
proc surface_finish*(surface: PSurface){.cdecl, importc: "cairo_surface_finish", 
    dynlib: LIB_CAIRO.}
proc surface_destroy*(surface: PSurface){.cdecl, 
    importc: "cairo_surface_destroy", dynlib: LIB_CAIRO.}
proc surface_get_reference_count*(surface: PSurface): int32{.cdecl, 
    importc: "cairo_surface_get_reference_count", dynlib: LIB_CAIRO.}
proc surface_status*(surface: PSurface): TStatus{.cdecl, 
    importc: "cairo_surface_status", dynlib: LIB_CAIRO.}
proc surface_get_type*(surface: PSurface): TSurfaceType{.cdecl, 
    importc: "cairo_surface_get_type", dynlib: LIB_CAIRO.}
proc surface_get_content*(surface: PSurface): TContent{.cdecl, 
    importc: "cairo_surface_get_content", dynlib: LIB_CAIRO.}
proc surface_write_to_png*(surface: PSurface, filename: cstring): TStatus{.
    cdecl, importc: "cairo_surface_write_to_png", dynlib: LIB_CAIRO.}
proc surface_write_to_png_stream*(surface: PSurface, write_func: TWriteFunc, 
                                  closure: pointer): TStatus{.cdecl, 
    importc: "cairo_surface_write_to_png_stream", dynlib: LIB_CAIRO.}
proc surface_get_user_data*(surface: PSurface, key: PUserDataKey): pointer{.
    cdecl, importc: "cairo_surface_get_user_data", dynlib: LIB_CAIRO.}
proc surface_set_user_data*(surface: PSurface, key: PUserDataKey, 
                            user_data: pointer, destroy: TDestroyFunc): TStatus{.
    cdecl, importc: "cairo_surface_set_user_data", dynlib: LIB_CAIRO.}
proc surface_get_font_options*(surface: PSurface, options: PFontOptions){.cdecl, 
    importc: "cairo_surface_get_font_options", dynlib: LIB_CAIRO.}
proc surface_flush*(surface: PSurface){.cdecl, importc: "cairo_surface_flush", 
                                        dynlib: LIB_CAIRO.}
proc surface_mark_dirty*(surface: PSurface){.cdecl, 
    importc: "cairo_surface_mark_dirty", dynlib: LIB_CAIRO.}
proc surface_mark_dirty_rectangle*(surface: PSurface, x, y, width, height: int32){.
    cdecl, importc: "cairo_surface_mark_dirty_rectangle", dynlib: LIB_CAIRO.}
proc surface_set_device_offset*(surface: PSurface, x_offset, y_offset: float64){.
    cdecl, importc: "cairo_surface_set_device_offset", dynlib: LIB_CAIRO.}
proc surface_get_device_offset*(surface: PSurface, 
                                x_offset, y_offset: var float64){.cdecl, 
    importc: "cairo_surface_get_device_offset", dynlib: LIB_CAIRO.}
proc surface_set_fallback_resolution*(surface: PSurface, x_pixels_per_inch, 
    y_pixels_per_inch: float64){.cdecl, importc: "cairo_surface_set_fallback_resolution", 
                                 dynlib: LIB_CAIRO.}
  #* Image-surface functions
proc image_surface_create*(format: TFormat, width, height: int32): PSurface{.
    cdecl, importc: "cairo_image_surface_create", dynlib: LIB_CAIRO.}
proc image_surface_create_for_data*(data: Pbyte, format: TFormat, 
                                    width, height, stride: int32): PSurface{.
    cdecl, importc: "cairo_image_surface_create_for_data", dynlib: LIB_CAIRO.}
proc image_surface_get_data*(surface: PSurface): cstring{.cdecl, 
    importc: "cairo_image_surface_get_data", dynlib: LIB_CAIRO.}
proc image_surface_get_format*(surface: PSurface): TFormat{.cdecl, 
    importc: "cairo_image_surface_get_format", dynlib: LIB_CAIRO.}
proc image_surface_get_width*(surface: PSurface): int32{.cdecl, 
    importc: "cairo_image_surface_get_width", dynlib: LIB_CAIRO.}
proc image_surface_get_height*(surface: PSurface): int32{.cdecl, 
    importc: "cairo_image_surface_get_height", dynlib: LIB_CAIRO.}
proc image_surface_get_stride*(surface: PSurface): int32{.cdecl, 
    importc: "cairo_image_surface_get_stride", dynlib: LIB_CAIRO.}
proc image_surface_create_from_png*(filename: cstring): PSurface{.cdecl, 
    importc: "cairo_image_surface_create_from_png", dynlib: LIB_CAIRO.}
proc image_surface_create_from_png_stream*(read_func: TReadFunc, 
    closure: pointer): PSurface{.cdecl, importc: "cairo_image_surface_create_from_png_stream", 
                                 dynlib: LIB_CAIRO.}
  #* Pattern creation functions
proc pattern_create_rgb*(red, green, blue: float64): PPattern{.cdecl, 
    importc: "cairo_pattern_create_rgb", dynlib: LIB_CAIRO.}
proc pattern_create_rgba*(red, green, blue, alpha: float64): PPattern{.cdecl, 
    importc: "cairo_pattern_create_rgba", dynlib: LIB_CAIRO.}
proc pattern_create_for_surface*(surface: PSurface): PPattern{.cdecl, 
    importc: "cairo_pattern_create_for_surface", dynlib: LIB_CAIRO.}
proc pattern_create_linear*(x0, y0, x1, y1: float64): PPattern{.cdecl, 
    importc: "cairo_pattern_create_linear", dynlib: LIB_CAIRO.}
proc pattern_create_radial*(cx0, cy0, radius0, cx1, cy1, radius1: float64): PPattern{.
    cdecl, importc: "cairo_pattern_create_radial", dynlib: LIB_CAIRO.}
proc pattern_reference*(pattern: PPattern): PPattern{.cdecl, 
    importc: "cairo_pattern_reference", dynlib: LIB_CAIRO.}
proc pattern_destroy*(pattern: PPattern){.cdecl, 
    importc: "cairo_pattern_destroy", dynlib: LIB_CAIRO.}
proc pattern_get_reference_count*(pattern: PPattern): int32{.cdecl, 
    importc: "cairo_pattern_get_reference_count", dynlib: LIB_CAIRO.}
proc pattern_status*(pattern: PPattern): TStatus{.cdecl, 
    importc: "cairo_pattern_status", dynlib: LIB_CAIRO.}
proc pattern_get_user_data*(pattern: PPattern, key: PUserDataKey): Pointer{.
    cdecl, importc: "cairo_pattern_get_user_data", dynlib: LIB_CAIRO.}
proc pattern_set_user_data*(pattern: PPattern, key: PUserDataKey, 
                            user_data: Pointer, destroy: TDestroyFunc): TStatus{.
    cdecl, importc: "cairo_pattern_set_user_data", dynlib: LIB_CAIRO.}
proc pattern_get_type*(pattern: PPattern): TPatternType{.cdecl, 
    importc: "cairo_pattern_get_type", dynlib: LIB_CAIRO.}
proc pattern_add_color_stop_rgb*(pattern: PPattern, 
                                 offset, red, green, blue: float64){.cdecl, 
    importc: "cairo_pattern_add_color_stop_rgb", dynlib: LIB_CAIRO.}
proc pattern_add_color_stop_rgba*(pattern: PPattern, 
                                  offset, red, green, blue, alpha: float64){.
    cdecl, importc: "cairo_pattern_add_color_stop_rgba", dynlib: LIB_CAIRO.}
proc pattern_set_matrix*(pattern: PPattern, matrix: PMatrix){.cdecl, 
    importc: "cairo_pattern_set_matrix", dynlib: LIB_CAIRO.}
proc pattern_get_matrix*(pattern: PPattern, matrix: PMatrix){.cdecl, 
    importc: "cairo_pattern_get_matrix", dynlib: LIB_CAIRO.}
proc pattern_set_extend*(pattern: PPattern, extend: TExtend){.cdecl, 
    importc: "cairo_pattern_set_extend", dynlib: LIB_CAIRO.}
proc pattern_get_extend*(pattern: PPattern): TExtend{.cdecl, 
    importc: "cairo_pattern_get_extend", dynlib: LIB_CAIRO.}
proc pattern_set_filter*(pattern: PPattern, filter: TFilter){.cdecl, 
    importc: "cairo_pattern_set_filter", dynlib: LIB_CAIRO.}
proc pattern_get_filter*(pattern: PPattern): TFilter{.cdecl, 
    importc: "cairo_pattern_get_filter", dynlib: LIB_CAIRO.}
proc pattern_get_rgba*(pattern: PPattern, red, green, blue, alpha: var float64): TStatus{.
    cdecl, importc: "cairo_pattern_get_rgba", dynlib: LIB_CAIRO.}
proc pattern_get_surface*(pattern: PPattern, surface: PPCairoSurface): TStatus{.
    cdecl, importc: "cairo_pattern_get_surface", dynlib: LIB_CAIRO.}
proc pattern_get_color_stop_rgba*(pattern: PPattern, index: int32, 
                                  offset, red, green, blue, alpha: var float64): TStatus{.
    cdecl, importc: "cairo_pattern_get_color_stop_rgba", dynlib: LIB_CAIRO.}
proc pattern_get_color_stop_count*(pattern: PPattern, count: var int32): TStatus{.
    cdecl, importc: "cairo_pattern_get_color_stop_count", dynlib: LIB_CAIRO.}
proc pattern_get_linear_points*(pattern: PPattern, x0, y0, x1, y1: var float64): TStatus{.
    cdecl, importc: "cairo_pattern_get_linear_points", dynlib: LIB_CAIRO.}
proc pattern_get_radial_circles*(pattern: PPattern, 
                                 x0, y0, r0, x1, y1, r1: var float64): TStatus{.
    cdecl, importc: "cairo_pattern_get_radial_circles", dynlib: LIB_CAIRO.}
  #* Matrix functions
proc matrix_init*(matrix: PMatrix, xx, yx, xy, yy, x0, y0: float64){.cdecl, 
    importc: "cairo_matrix_init", dynlib: LIB_CAIRO.}
proc matrix_init_identity*(matrix: PMatrix){.cdecl, 
    importc: "cairo_matrix_init_identity", dynlib: LIB_CAIRO.}
proc matrix_init_translate*(matrix: PMatrix, tx, ty: float64){.cdecl, 
    importc: "cairo_matrix_init_translate", dynlib: LIB_CAIRO.}
proc matrix_init_scale*(matrix: PMatrix, sx, sy: float64){.cdecl, 
    importc: "cairo_matrix_init_scale", dynlib: LIB_CAIRO.}
proc matrix_init_rotate*(matrix: PMatrix, radians: float64){.cdecl, 
    importc: "cairo_matrix_init_rotate", dynlib: LIB_CAIRO.}
proc matrix_translate*(matrix: PMatrix, tx, ty: float64){.cdecl, 
    importc: "cairo_matrix_translate", dynlib: LIB_CAIRO.}
proc matrix_scale*(matrix: PMatrix, sx, sy: float64){.cdecl, 
    importc: "cairo_matrix_scale", dynlib: LIB_CAIRO.}
proc matrix_rotate*(matrix: PMatrix, radians: float64){.cdecl, 
    importc: "cairo_matrix_rotate", dynlib: LIB_CAIRO.}
proc matrix_invert*(matrix: PMatrix): TStatus{.cdecl, 
    importc: "cairo_matrix_invert", dynlib: LIB_CAIRO.}
proc matrix_multiply*(result, a, b: PMatrix){.cdecl, 
    importc: "cairo_matrix_multiply", dynlib: LIB_CAIRO.}
proc matrix_transform_distance*(matrix: PMatrix, dx, dy: var float64){.cdecl, 
    importc: "cairo_matrix_transform_distance", dynlib: LIB_CAIRO.}
proc matrix_transform_point*(matrix: PMatrix, x, y: var float64){.cdecl, 
    importc: "cairo_matrix_transform_point", dynlib: LIB_CAIRO.}
  #* PDF functions
proc pdf_surface_create*(filename: cstring, 
                         width_in_points, height_in_points: float64): PSurface{.
    cdecl, importc: "cairo_pdf_surface_create", dynlib: LIB_CAIRO.}
proc pdf_surface_create_for_stream*(write_func: TWriteFunc, closure: Pointer, 
                                    width_in_points, height_in_points: float64): PSurface{.
    cdecl, importc: "cairo_pdf_surface_create_for_stream", dynlib: LIB_CAIRO.}
proc pdf_surface_set_size*(surface: PSurface, 
                           width_in_points, height_in_points: float64){.cdecl, 
    importc: "cairo_pdf_surface_set_size", dynlib: LIB_CAIRO.}
  #* PS functions
proc ps_surface_create*(filename: cstring, 
                        width_in_points, height_in_points: float64): PSurface{.
    cdecl, importc: "cairo_ps_surface_create", dynlib: LIB_CAIRO.}
proc ps_surface_create_for_stream*(write_func: TWriteFunc, closure: Pointer, 
                                   width_in_points, height_in_points: float64): PSurface{.
    cdecl, importc: "cairo_ps_surface_create_for_stream", dynlib: LIB_CAIRO.}
proc ps_surface_set_size*(surface: PSurface, 
                          width_in_points, height_in_points: float64){.cdecl, 
    importc: "cairo_ps_surface_set_size", dynlib: LIB_CAIRO.}
proc ps_surface_dsc_comment*(surface: PSurface, comment: cstring){.cdecl, 
    importc: "cairo_ps_surface_dsc_comment", dynlib: LIB_CAIRO.}
proc ps_surface_dsc_begin_setup*(surface: PSurface){.cdecl, 
    importc: "cairo_ps_surface_dsc_begin_setup", dynlib: LIB_CAIRO.}
proc ps_surface_dsc_begin_page_setup*(surface: PSurface){.cdecl, 
    importc: "cairo_ps_surface_dsc_begin_page_setup", dynlib: LIB_CAIRO.}
  #* SVG functions
proc svg_surface_create*(filename: cstring, 
                         width_in_points, height_in_points: float64): PSurface{.
    cdecl, importc: "cairo_svg_surface_create", dynlib: LIB_CAIRO.}
proc svg_surface_create_for_stream*(write_func: TWriteFunc, closure: Pointer, 
                                    width_in_points, height_in_points: float64): PSurface{.
    cdecl, importc: "cairo_svg_surface_create_for_stream", dynlib: LIB_CAIRO.}
proc svg_surface_restrict_to_version*(surface: PSurface, version: TSvgVersion){.
    cdecl, importc: "cairo_svg_surface_restrict_to_version", dynlib: LIB_CAIRO.}
  #todo: see how translate this
  #procedure cairo_svg_get_versions(TCairoSvgVersion const	**versions,
  #                        int                      	 *num_versions);
proc svg_version_to_string*(version: TSvgVersion): cstring{.cdecl, 
    importc: "cairo_svg_version_to_string", dynlib: LIB_CAIRO.}
  #* Functions to be used while debugging (not intended for use in production code)
proc debug_reset_static_data*(){.cdecl, 
                                 importc: "cairo_debug_reset_static_data", 
                                 dynlib: LIB_CAIRO.}
# implementation

proc version(major, minor, micro: var int32) = 
  var version: int32
  version = version()
  major = version div 10000'i32
  minor = (version mod (major * 10000'i32)) div 100'i32
  micro = (version mod ((major * 10000'i32) + (minor * 100'i32)))