/// Module for [RcProperty] class
module gid.gtk3.rc_property;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.string_;
import gid.glib2.types;
import gid.gobject2.param_spec;
import gid.gobject2.value;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    Deprecated
*/
class RcProperty : StructWrap!(GtkRcProperty)
{
  /**
      Create a `rc_property.RcProperty` wrap type.
      Params:
        typeName = quark-ified type identifier
        propertyName = quark-ified property identifier like
            “GtkScrollbar::spacing”
        origin = field similar to one found in #GtkSettingsValue
  */
  this(gid.glib2.types.Quark typeName = gid.glib2.types.Quark.init, gid.glib2.types.Quark propertyName = gid.glib2.types.Quark.init, string origin = string.init) nothrow
  {
    this.typeName = typeName;
    this.propertyName = propertyName;
    this.origin = origin;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `typeName` field.
      Returns: quark-ified type identifier
  */
  @property gid.glib2.types.Quark typeName() nothrow
  {
    return (cast(GtkRcProperty*)this._cPtr).typeName;
  }

  /**
      Set `typeName` field.
      Params:
        propval = quark-ified type identifier
  */
  @property void typeName(gid.glib2.types.Quark propval) nothrow
  {
    (cast(GtkRcProperty*)this._cPtr).typeName = propval;
  }

  /**
      Get `propertyName` field.
      Returns: quark-ified property identifier like
          “GtkScrollbar::spacing”
  */
  @property gid.glib2.types.Quark propertyName() nothrow
  {
    return (cast(GtkRcProperty*)this._cPtr).propertyName;
  }

  /**
      Set `propertyName` field.
      Params:
        propval = quark-ified property identifier like
            “GtkScrollbar::spacing”
  */
  @property void propertyName(gid.glib2.types.Quark propval) nothrow
  {
    (cast(GtkRcProperty*)this._cPtr).propertyName = propval;
  }

  private const(char)* _originRef; // Keeps borrowed GC string alive

  /**
      Get `origin` field.
      Returns: field similar to one found in #GtkSettingsValue
  */
  @property string origin() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRcProperty*)this._cPtr).origin);
  }

  /**
      Set `origin` field.
      Params:
        propval = field similar to one found in #GtkSettingsValue
  */
  @property void origin(string propval) nothrow
  {
    if (_refuseBorrowedStore("origin"))
      return;

    _originRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkRcProperty*)this._cPtr).origin = cast(char*)_originRef;
  }

  /**
      Get `value` field.
      Returns: field similar to one found in #GtkSettingsValue
  */
  @property gid.gobject2.value.Value value() nothrow
  {
    return cToD!(gid.gobject2.value.Value)(cast(void*)&(cast(GtkRcProperty*)this._cPtr).value);
  }

  /**
      A #GtkRcPropertyParser for use with [gid.gtk3.settings.Settings.installPropertyParser]
      or [gid.gtk3.widget_class.WidgetClass.installStylePropertyParser] which parses
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
  static bool parseBorder(gid.gobject2.param_spec.ParamSpec pspec, gid.glib2.string_.String gstring, gid.gobject2.value.Value propertyValue) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_border(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gid.gtk3.settings.Settings.installPropertyParser]
      or [gid.gtk3.widget_class.WidgetClass.installStylePropertyParser] which parses a
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
  static bool parseColor(gid.gobject2.param_spec.ParamSpec pspec, gid.glib2.string_.String gstring, gid.gobject2.value.Value propertyValue) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_color(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gid.gtk3.settings.Settings.installPropertyParser]
      or [gid.gtk3.widget_class.WidgetClass.installStylePropertyParser] which parses a single
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
  static bool parseEnum(gid.gobject2.param_spec.ParamSpec pspec, gid.glib2.string_.String gstring, gid.gobject2.value.Value propertyValue) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_enum(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gid.gtk3.settings.Settings.installPropertyParser]
      or [gid.gtk3.widget_class.WidgetClass.installStylePropertyParser] which parses flags.
      
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
  static bool parseFlags(gid.gobject2.param_spec.ParamSpec pspec, gid.glib2.string_.String gstring, gid.gobject2.value.Value propertyValue) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_flags(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A #GtkRcPropertyParser for use with [gid.gtk3.settings.Settings.installPropertyParser]
      or [gid.gtk3.widget_class.WidgetClass.installStylePropertyParser] which parses a
      requisition in the form
      `"{ width, height }"` for integers `width` and `height`.
  
      Params:
        pspec = a #GParamSpec
        gstring = the #GString to be parsed
        propertyValue = a #GValue which must hold boxed values.
      Returns: true if gstring could be parsed and property_value
        has been set to the resulting #GtkRequisition.
  */
  static bool parseRequisition(gid.gobject2.param_spec.ParamSpec pspec, gid.glib2.string_.String gstring, gid.gobject2.value.Value propertyValue) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_rc_property_parse_requisition(pspec ? cast(const(GParamSpec)*)pspec._cPtr(No.Dup) : null, gstring ? cast(const(GString)*)gstring._cPtr(No.Dup) : null, propertyValue ? cast(GValue*)propertyValue._cPtr(No.Dup) : null);
    return _retval;
  }
}
