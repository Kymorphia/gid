/// Module for [RcProperty] class
module gtk.rc_property;

import gid.gid;
import glib.string_;
import glib.types;
import gobject.param_spec;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Deprecated
*/
class RcProperty
{
  GtkRcProperty _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.rc_property.RcProperty");

    _cInstance = *cast(GtkRcProperty*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `typeName` field.
      Returns: quark-ified type identifier
  */
  @property glib.types.Quark typeName()
  {
    return (cast(GtkRcProperty*)this._cPtr).typeName;
  }

  /**
      Set `typeName` field.
      Params:
        propval = quark-ified type identifier
  */
  @property void typeName(glib.types.Quark propval)
  {
    (cast(GtkRcProperty*)this._cPtr).typeName = propval;
  }

  /**
      Get `propertyName` field.
      Returns: quark-ified property identifier like
          “GtkScrollbar::spacing”
  */
  @property glib.types.Quark propertyName()
  {
    return (cast(GtkRcProperty*)this._cPtr).propertyName;
  }

  /**
      Set `propertyName` field.
      Params:
        propval = quark-ified property identifier like
            “GtkScrollbar::spacing”
  */
  @property void propertyName(glib.types.Quark propval)
  {
    (cast(GtkRcProperty*)this._cPtr).propertyName = propval;
  }

  /**
      Get `origin` field.
      Returns: field similar to one found in #GtkSettingsValue
  */
  @property string origin()
  {
    return cToD!(string)(cast(void*)(cast(GtkRcProperty*)this._cPtr).origin);
  }

  /**
      Set `origin` field.
      Params:
        propval = field similar to one found in #GtkSettingsValue
  */
  @property void origin(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRcProperty*)this._cPtr).origin);
    dToC(propval, cast(void*)&(cast(GtkRcProperty*)this._cPtr).origin);
  }

  /**
      Get `value` field.
      Returns: field similar to one found in #GtkSettingsValue
  */
  @property gobject.value.Value value()
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(GtkRcProperty*)this._cPtr).value);
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses
      borders in the form
      `"{ left, right, top, bottom }"` for integers
      left, right, top and bottom.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold boxed values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GtkBorder.
  */
  static bool parseBorder(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_border(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses a
      color given either by its name or in the form
      `{ red, green, blue }` where red, green and
      blue are integers between 0 and 65535 or floating-point numbers
      between 0 and 1.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold #GdkColor values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GdkColor.
  */
  static bool parseColor(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_color(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses a single
      enumeration value.
      
      The enumeration value can be specified by its name, its nickname or
      its numeric value. For consistency with flags parsing, the value
      may be surrounded by parentheses.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold enum values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GEnumValue.
  */
  static bool parseEnum(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_enum(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses flags.
      
      Flags can be specified by their name, their nickname or
      numerically. Multiple flags can be specified in the form
      `"( flag1 | flag2 | ... )"`.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold flags values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting flags value.
  */
  static bool parseFlags(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_flags(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gtk.settings.Settings.installPropertyParser]
      or [gtk.widget_class.WidgetClass.installStylePropertyParser] which parses a
      requisition in the form
      `"{ width, height }"` for integers `width` and `height`.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold boxed values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GtkRequisition.
  */
  static bool parseRequisition(gobject.param_spec.ParamSpec pspec, glib.string_.String gstring, gobject.value.Value propertyValue)
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_requisition(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }
}
