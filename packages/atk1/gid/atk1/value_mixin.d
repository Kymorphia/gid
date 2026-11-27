/// Module for [Value] interface mixin
module gid.atk1.value_mixin;

public import gid.core.basictypes;
public import gid.atk1.value;
public import gid.atk1.value_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.range;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.value;

/**
    The ATK interface implemented by valuators and components which display or select a value from a bounded range of values.
    
    #AtkValue should be implemented for components which either display
    a value from a bounded range, or which allow the user to specify a
    value from a bounded range, or both. For instance, most sliders and
    range controls, as well as dials, should have #AtkObject
    representations which implement #AtkValue on the component's
    behalf. #AtKValues may be read-only, in which case attempts to
    alter the value return would fail.
    
    <refsect1 id="current-value-text">
    <title>On the subject of current value text</title>
    <para>
    In addition to providing the current value, implementors can
    optionally provide an end-user-consumable textual description
    associated with this value. This description should be included
    when the numeric value fails to convey the full, on-screen
    representation seen by users.
    </para>
    
    <example>
    <title>Password strength</title>
    A password strength meter whose value changes as the user types
    their new password. Red is used for values less than 4.0, yellow
    for values between 4.0 and 7.0, and green for values greater than
    7.0. In this instance, value text should be provided by the
    implementor. Appropriate value text would be "weak", "acceptable,"
    and "strong" respectively.
    </example>
    
    A level bar whose value changes to reflect the battery charge. The
    color remains the same regardless of the charge and there is no
    on-screen text reflecting the fullness of the battery. In this
    case, because the position within the bar is the only indication
    the user has of the current charge, value text should not be
    provided by the implementor.
    
    <refsect2 id="implementor-notes">
    <title>Implementor Notes</title>
    <para>
    Implementors should bear in mind that assistive technologies will
    likely prefer the value text provided over the numeric value when
    presenting a widget's value. As a result, strings not intended for
    end users should not be exposed in the value text, and strings
    which are exposed should be localized. In the case of widgets which
    display value text on screen, for instance through a separate label
    in close proximity to the value-displaying widget, it is still
    expected that implementors will expose the value text using the
    above API.
    </para>
    
    <para>
    #AtkValue should NOT be implemented for widgets whose displayed
    value is not reflective of a meaningful amount. For instance, a
    progress pulse indicator whose value alternates between 0.0 and 1.0
    to indicate that some process is still taking place should not
    implement #AtkValue because the current value does not reflect
    progress towards completion.
    </para>
    </refsect2>
    </refsect1>
    
    <refsect1 id="ranges">
    <title>On the subject of ranges</title>
    <para>
    In addition to providing the minimum and maximum values,
    implementors can optionally provide details about subranges
    associated with the widget. These details should be provided by the
    implementor when both of the following are communicated visually to
    the end user:
    </para>
    <itemizedlist>
      <listitem>The existence of distinct ranges such as "weak",
      "acceptable", and "strong" indicated by color, bar tick marks,
      and/or on-screen text.</listitem>
      <listitem>Where the current value stands within a given subrange,
      for instance illustrating progression from very "weak" towards
      nearly "acceptable" through changes in shade and/or position on
      the bar within the "weak" subrange.</listitem>
    </itemizedlist>
    <para>
    If both of the above do not apply to the widget, it should be
    sufficient to expose the numeric value, along with the value text
    if appropriate, to make the widget accessible.
    </para>
    
    <refsect2 id="ranges-implementor-notes">
    <title>Implementor Notes</title>
    <para>
    If providing subrange details is deemed necessary, all possible
    values of the widget are expected to fall within one of the
    subranges defined by the implementor.
    </para>
    </refsect2>
    </refsect1>
    
    <refsect1 id="localization">
    <title>On the subject of localization of end-user-consumable text
    values</title>
    <para>
    Because value text and subrange descriptors are human-consumable,
    implementors are expected to provide localized strings which can be
    directly presented to end users via their assistive technology. In
    order to simplify this for implementors, implementors can use
    [gid.atk1.global.valueTypeGetLocalizedName] with the following
    already-localized constants for commonly-needed values can be used:
    </para>
    
    <itemizedlist>
      <listitem>ATK_VALUE_VERY_WEAK</listitem>
      <listitem>ATK_VALUE_WEAK</listitem>
      <listitem>ATK_VALUE_ACCEPTABLE</listitem>
      <listitem>ATK_VALUE_STRONG</listitem>
      <listitem>ATK_VALUE_VERY_STRONG</listitem>
      <listitem>ATK_VALUE_VERY_LOW</listitem>
      <listitem>ATK_VALUE_LOW</listitem>
      <listitem>ATK_VALUE_MEDIUM</listitem>
      <listitem>ATK_VALUE_HIGH</listitem>
      <listitem>ATK_VALUE_VERY_HIGH</listitem>
      <listitem>ATK_VALUE_VERY_BAD</listitem>
      <listitem>ATK_VALUE_BAD</listitem>
      <listitem>ATK_VALUE_GOOD</listitem>
      <listitem>ATK_VALUE_VERY_GOOD</listitem>
      <listitem>ATK_VALUE_BEST</listitem>
      <listitem>ATK_VALUE_SUBSUBOPTIMAL</listitem>
      <listitem>ATK_VALUE_SUBOPTIMAL</listitem>
      <listitem>ATK_VALUE_OPTIMAL</listitem>
    </itemizedlist>
    <para>
    Proposals for additional constants, along with their use cases,
    should be submitted to the GNOME Accessibility Team.
    </para>
    </refsect1>
    
    <refsect1 id="changes">
    <title>On the subject of changes</title>
    <para>
    Note that if there is a textual description associated with the new
    numeric value, that description should be included regardless of
    whether or not it has also changed.
    </para>
    </refsect1>
*/
template ValueT()
{

  /**
      Gets the value of this object.
  
      Params:
        value = a #GValue representing the current accessible value
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCurrentValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getValueAndText]
        instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetCurrentValue(out gid.gobject2.value.Value value)
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getCurrentValue)
      return;

    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _klass.getCurrentValue(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the minimum increment by which the value of this object may be
      changed.  If zero, the minimum increment is undefined, which may
      mean that it is limited only by the floating point precision of the
      platform.
      Returns: the minimum increment by which the value of this
        object may be changed. zero if undefined.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIncrement`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected double vfuncGetIncrement()
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getIncrement)
      return typeof(return).init;

    double _retval;
    _retval = _klass.getIncrement(cast(AtkValue*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum value of this object.
  
      Params:
        value = a #GValue representing the maximum accessible value
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetMaximumValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getRange] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetMaximumValue(out gid.gobject2.value.Value value)
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getMaximumValue)
      return;

    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _klass.getMaximumValue(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the minimum increment by which the value of this object may be changed.  If zero,
      the minimum increment is undefined, which may mean that it is limited only by the
      floating point precision of the platform.
  
      Params:
        value = a #GValue representing the minimum increment by which the accessible value may be changed
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetMinimumIncrement`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getIncrement] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetMinimumIncrement(out gid.gobject2.value.Value value)
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getMinimumIncrement)
      return;

    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _klass.getMinimumIncrement(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the minimum value of this object.
  
      Params:
        value = a #GValue representing the minimum accessible value
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetMinimumValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getRange] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetMinimumValue(out gid.gobject2.value.Value value)
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getMinimumValue)
      return;

    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _klass.getMinimumValue(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the range of this object.
      Returns: a newly allocated #AtkRange
        that represents the minimum, maximum and descriptor (if available)
        of obj. NULL if that range is not defined.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRange`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.range.Range vfuncGetRange()
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getRange)
      return typeof(return).init;

    AtkRange* _cretval;
    _cretval = _klass.getRange(cast(AtkValue*)this._cPtr);
    auto _retval = _cretval ? new gid.atk1.range.Range(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of subranges defined for this object. See #AtkValue
      introduction for examples of subranges and when to expose them.
      Returns: an #GSList of
        #AtkRange which each of the subranges defined for this object. Free
        the returns list with [gid.glib2.slist.SList.free].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSubRanges`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.range.Range[] vfuncGetSubRanges()
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getSubRanges)
      return typeof(return).init;

    GSList* _cretval;
    _cretval = _klass.getSubRanges(cast(AtkValue*)this._cPtr);
    auto _retval = gSListToD!(gid.atk1.range.Range, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets the current value and the human readable text alternative of
      obj. text is a newly created string, that must be freed by the
      caller. Can be NULL if no descriptor is available.
  
      Params:
        value = address of #gdouble to put the current value of obj
        text = address of #gchar to put the human
          readable text alternative for value
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetValueAndText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetValueAndText(out double value, out string text)
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.getValueAndText)
      return;

    char* _text;
    _klass.getValueAndText(cast(AtkValue*)this._cPtr, cast(double*)&value, &_text);
    text = _text.fromCString!(Yes.Free);
  }

  /**
      Sets the value of this object.
  
      Params:
        value = a #GValue which is the desired new accessible value.
      Returns: true if new value is successfully set, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetCurrentValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.setValue] instead.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetCurrentValue(gid.gobject2.value.Value value)
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.setCurrentValue)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCurrentValue(cast(AtkValue*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the value of this object.
      
      This method is intended to provide a way to change the value of the
      object. In any case, it is possible that the value can't be
      modified (ie: a read-only component). If the value changes due this
      call, it is possible that the text could change, and will trigger
      an #AtkValue::value-changed signal emission.
      
      Note for implementors: the deprecated [gid.atk1.value.Value.setCurrentValue]
      method returned TRUE or FALSE depending if the value was assigned
      or not. In the practice several implementors were not able to
      decide it, and returned TRUE in any case. For that reason it is not
      required anymore to return if the value was properly assigned or
      not.
  
      Params:
        newValue = a double which is the desired new accessible value.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetValue(double newValue)
  {
    auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.value.Value._getGType);
    if (!_klass || !_klass.setValue)
      return;

    _klass.setValue(cast(AtkValue*)this._cPtr, newValue);
  }

  /**
      Gets the value of this object.
  
      Params:
        value = a #GValue representing the current accessible value
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getValueAndText]
        instead.
  */
  override void getCurrentValue(out gid.gobject2.value.Value value) nothrow
  {
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    atk_value_get_current_value(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the minimum increment by which the value of this object may be
      changed.  If zero, the minimum increment is undefined, which may
      mean that it is limited only by the floating point precision of the
      platform.
      Returns: the minimum increment by which the value of this
        object may be changed. zero if undefined.
  */
  override double getIncrement() nothrow
  {
    double _retval;
    _retval = atk_value_get_increment(cast(AtkValue*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum value of this object.
  
      Params:
        value = a #GValue representing the maximum accessible value
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getRange] instead.
  */
  override void getMaximumValue(out gid.gobject2.value.Value value) nothrow
  {
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    atk_value_get_maximum_value(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the minimum increment by which the value of this object may be changed.  If zero,
      the minimum increment is undefined, which may mean that it is limited only by the
      floating point precision of the platform.
  
      Params:
        value = a #GValue representing the minimum increment by which the accessible value may be changed
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getIncrement] instead.
  */
  override void getMinimumIncrement(out gid.gobject2.value.Value value) nothrow
  {
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    atk_value_get_minimum_increment(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the minimum value of this object.
  
      Params:
        value = a #GValue representing the minimum accessible value
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.getRange] instead.
  */
  override void getMinimumValue(out gid.gobject2.value.Value value) nothrow
  {
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    atk_value_get_minimum_value(cast(AtkValue*)this._cPtr, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Gets the range of this object.
      Returns: a newly allocated #AtkRange
        that represents the minimum, maximum and descriptor (if available)
        of obj. NULL if that range is not defined.
  */
  override gid.atk1.range.Range getRange() nothrow
  {
    AtkRange* _cretval;
    _cretval = atk_value_get_range(cast(AtkValue*)this._cPtr);
    auto _retval = _cretval ? new gid.atk1.range.Range(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of subranges defined for this object. See #AtkValue
      introduction for examples of subranges and when to expose them.
      Returns: an #GSList of
        #AtkRange which each of the subranges defined for this object. Free
        the returns list with [gid.glib2.slist.SList.free].
  */
  override gid.atk1.range.Range[] getSubRanges() nothrow
  {
    GSList* _cretval;
    _cretval = atk_value_get_sub_ranges(cast(AtkValue*)this._cPtr);
    auto _retval = gSListToD!(gid.atk1.range.Range, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets the current value and the human readable text alternative of
      obj. text is a newly created string, that must be freed by the
      caller. Can be NULL if no descriptor is available.
  
      Params:
        value = address of #gdouble to put the current value of obj
        text = address of #gchar to put the human
          readable text alternative for value
  */
  override void getValueAndText(out double value, out string text) nothrow
  {
    char* _text;
    atk_value_get_value_and_text(cast(AtkValue*)this._cPtr, cast(double*)&value, &_text);
    text = _text.fromCString!(Yes.Free);
  }

  /**
      Sets the value of this object.
  
      Params:
        value = a #GValue which is the desired new accessible value.
      Returns: true if new value is successfully set, false otherwise.
  
      Deprecated: Since 2.12. Use [gid.atk1.value.Value.setValue] instead.
  */
  override bool setCurrentValue(gid.gobject2.value.Value value) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_value_set_current_value(cast(AtkValue*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the value of this object.
      
      This method is intended to provide a way to change the value of the
      object. In any case, it is possible that the value can't be
      modified (ie: a read-only component). If the value changes due this
      call, it is possible that the text could change, and will trigger
      an #AtkValue::value-changed signal emission.
      
      Note for implementors: the deprecated [gid.atk1.value.Value.setCurrentValue]
      method returned TRUE or FALSE depending if the value was assigned
      or not. In the practice several implementors were not able to
      decide it, and returned TRUE in any case. For that reason it is not
      required anymore to return if the value was properly assigned or
      not.
  
      Params:
        newValue = a double which is the desired new accessible value.
  */
  override void setValue(double newValue) nothrow
  {
    atk_value_set_value(cast(AtkValue*)this._cPtr, newValue);
  }

  /**
      Connect to `ValueChanged` signal.
  
      The 'value-changed' signal is emitted when the current value
        that represent the object changes. value is the numerical
        representation of this new value.  text is the human
        readable text alternative of value, and can be NULL if it is
        not available. Note that if there is a textual description
        associated with the new numeric value, that description
        should be included regardless of whether or not it has also
        changed.
        
        Example: a password meter whose value changes as the user
        types their new password. Appropiate value text would be
        "weak", "acceptable" and "strong".
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double value, string text, gid.atk1.value.Value value)`
  
          `value` the new value in a numerical form. (optional)
  
          `text` human readable text alternative (also called
            description) of this object. NULL if not available. (optional)
  
          `value` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.atk1.value.Value)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.valueChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.value.Value (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_value_Value(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIncrement", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMaximumValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMinimumIncrement", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMinimumValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRange", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSubRanges", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetValueAndText", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCurrentValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetValue", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.value.Value vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_value_Value(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_current_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIncrement", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_increment");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMaximumValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_maximum_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMinimumIncrement", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_minimum_increment");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMinimumValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_minimum_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRange", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_range");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSubRanges", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_sub_ranges");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetValueAndText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "get_value_and_text");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCurrentValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "set_current_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_value_Value(iface, "set_value");
  }

  private static void _installIfaceVfunc_gid_atk1_value_Value(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkValueIface*)iface;

    switch (vfunc)
    {
      case "get_current_value":
      {
        static extern(C) void _vfuncGetCurrentValueTramp(AtkValue* obj, GValue* value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getCurrentValue)
              return (cast(typeof(&_vfuncGetCurrentValueTramp))_klass.getCurrentValue)(obj, value);
            return;
          }

          gid.gobject2.value.Value _value;

          try
          {
            _obj.vfuncGetCurrentValue(_value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetCurrentValue");
          }
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }

        }

        _klass.getCurrentValue = cast(typeof(_klass.getCurrentValue))&_vfuncGetCurrentValueTramp;
        break;
      }
      case "get_increment":
      {
        static extern(C) double _vfuncGetIncrementTramp(AtkValue* obj) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getIncrement)
              return (cast(typeof(&_vfuncGetIncrementTramp))_klass.getIncrement)(obj);
            return typeof(return).init;
          }

          double _retval;

          try
          {
            _retval = _obj.vfuncGetIncrement();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetIncrement");
          }
          return _retval;
        }

        _klass.getIncrement = cast(typeof(_klass.getIncrement))&_vfuncGetIncrementTramp;
        break;
      }
      case "get_maximum_value":
      {
        static extern(C) void _vfuncGetMaximumValueTramp(AtkValue* obj, GValue* value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getMaximumValue)
              return (cast(typeof(&_vfuncGetMaximumValueTramp))_klass.getMaximumValue)(obj, value);
            return;
          }

          gid.gobject2.value.Value _value;

          try
          {
            _obj.vfuncGetMaximumValue(_value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetMaximumValue");
          }
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }

        }

        _klass.getMaximumValue = cast(typeof(_klass.getMaximumValue))&_vfuncGetMaximumValueTramp;
        break;
      }
      case "get_minimum_increment":
      {
        static extern(C) void _vfuncGetMinimumIncrementTramp(AtkValue* obj, GValue* value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getMinimumIncrement)
              return (cast(typeof(&_vfuncGetMinimumIncrementTramp))_klass.getMinimumIncrement)(obj, value);
            return;
          }

          gid.gobject2.value.Value _value;

          try
          {
            _obj.vfuncGetMinimumIncrement(_value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetMinimumIncrement");
          }
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }

        }

        _klass.getMinimumIncrement = cast(typeof(_klass.getMinimumIncrement))&_vfuncGetMinimumIncrementTramp;
        break;
      }
      case "get_minimum_value":
      {
        static extern(C) void _vfuncGetMinimumValueTramp(AtkValue* obj, GValue* value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getMinimumValue)
              return (cast(typeof(&_vfuncGetMinimumValueTramp))_klass.getMinimumValue)(obj, value);
            return;
          }

          gid.gobject2.value.Value _value;

          try
          {
            _obj.vfuncGetMinimumValue(_value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetMinimumValue");
          }
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }

        }

        _klass.getMinimumValue = cast(typeof(_klass.getMinimumValue))&_vfuncGetMinimumValueTramp;
        break;
      }
      case "get_range":
      {
        static extern(C) AtkRange* _vfuncGetRangeTramp(AtkValue* obj) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getRange)
              return (cast(typeof(&_vfuncGetRangeTramp))_klass.getRange)(obj);
            return typeof(return).init;
          }

          gid.atk1.range.Range _dretval;

          try
          {
            _dretval = _obj.vfuncGetRange();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetRange");
          }
          auto _retval = _dretval ? cast(AtkRange*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getRange = cast(typeof(_klass.getRange))&_vfuncGetRangeTramp;
        break;
      }
      case "get_sub_ranges":
      {
        static extern(C) GSList* _vfuncGetSubRangesTramp(AtkValue* obj) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getSubRanges)
              return (cast(typeof(&_vfuncGetSubRangesTramp))_klass.getSubRanges)(obj);
            return typeof(return).init;
          }

          gid.atk1.range.Range[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetSubRanges();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetSubRanges");
          }
          auto _retval = gSListFromD!(gid.atk1.range.Range)(_dretval);

          return _retval;
        }

        _klass.getSubRanges = cast(typeof(_klass.getSubRanges))&_vfuncGetSubRangesTramp;
        break;
      }
      case "get_value_and_text":
      {
        static extern(C) void _vfuncGetValueAndTextTramp(AtkValue* obj, double* value, char** text) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.getValueAndText)
              return (cast(typeof(&_vfuncGetValueAndTextTramp))_klass.getValueAndText)(obj, value, text);
            return;
          }

          typeof(*text) _textNull;
          if (!text)
            text = &_textNull;

          string _text;

          try
          {
            _obj.vfuncGetValueAndText(*value, _text);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncGetValueAndText");
          }
          *text = _text.toCString!(Yes.Malloc, No.Nullable);

        }

        _klass.getValueAndText = cast(typeof(_klass.getValueAndText))&_vfuncGetValueAndTextTramp;
        break;
      }
      case "set_current_value":
      {
        static extern(C) gboolean _vfuncSetCurrentValueTramp(AtkValue* obj, const(GValue)* value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.setCurrentValue)
              return (cast(typeof(&_vfuncSetCurrentValueTramp))_klass.setCurrentValue)(obj, value);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetCurrentValue(value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncSetCurrentValue");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setCurrentValue = cast(typeof(_klass.setCurrentValue))&_vfuncSetCurrentValueTramp;
        break;
      }
      case "set_value":
      {
        static extern(C) void _vfuncSetValueTramp(AtkValue* obj, double newValue) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkValueIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj), gid.atk1.value.Value._getGType);
            if (_klass && _klass.setValue)
              return (cast(typeof(&_vfuncSetValueTramp))_klass.setValue)(obj, newValue);
            return;
          }

          try
          {
            _obj.vfuncSetValue(newValue);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.value.Value.vfuncSetValue");
          }
        }

        _klass.setValue = cast(typeof(_klass.setValue))&_vfuncSetValueTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.value.Value]
template ValueGidBuilderT()
{
}
