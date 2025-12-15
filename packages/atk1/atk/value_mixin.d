/// Module for [Value] interface mixin
module atk.value_mixin;

public import atk.value_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.range;
public import atk.types;
public import gid.gid;
public import gobject.dclosure;
public import gobject.value;

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
    [atk.global.valueTypeGetLocalizedName] with the following
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
  
      Deprecated: Since 2.12. Use [atk.value.Value.getValueAndText]
        instead.
  */
  override void getCurrentValue(out gobject.value.Value value)
  {
    GValue _value;
    atk_value_get_current_value(cast(AtkValue*)this._cPtr, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Gets the minimum increment by which the value of this object may be
      changed.  If zero, the minimum increment is undefined, which may
      mean that it is limited only by the floating point precision of the
      platform.
      Returns: the minimum increment by which the value of this
        object may be changed. zero if undefined.
  */
  override double getIncrement()
  {
    double _retval;
    _retval = atk_value_get_increment(cast(AtkValue*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum value of this object.
  
      Params:
        value = a #GValue representing the maximum accessible value
  
      Deprecated: Since 2.12. Use [atk.value.Value.getRange] instead.
  */
  override void getMaximumValue(out gobject.value.Value value)
  {
    GValue _value;
    atk_value_get_maximum_value(cast(AtkValue*)this._cPtr, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Gets the minimum increment by which the value of this object may be changed.  If zero,
      the minimum increment is undefined, which may mean that it is limited only by the
      floating point precision of the platform.
  
      Params:
        value = a #GValue representing the minimum increment by which the accessible value may be changed
  
      Deprecated: Since 2.12. Use [atk.value.Value.getIncrement] instead.
  */
  override void getMinimumIncrement(out gobject.value.Value value)
  {
    GValue _value;
    atk_value_get_minimum_increment(cast(AtkValue*)this._cPtr, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Gets the minimum value of this object.
  
      Params:
        value = a #GValue representing the minimum accessible value
  
      Deprecated: Since 2.12. Use [atk.value.Value.getRange] instead.
  */
  override void getMinimumValue(out gobject.value.Value value)
  {
    GValue _value;
    atk_value_get_minimum_value(cast(AtkValue*)this._cPtr, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Gets the range of this object.
      Returns: a newly allocated #AtkRange
        that represents the minimum, maximum and descriptor (if available)
        of obj. NULL if that range is not defined.
  */
  override atk.range.Range getRange()
  {
    AtkRange* _cretval;
    _cretval = atk_value_get_range(cast(AtkValue*)this._cPtr);
    auto _retval = _cretval ? new atk.range.Range(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of subranges defined for this object. See #AtkValue
      introduction for examples of subranges and when to expose them.
      Returns: an #GSList of
        #AtkRange which each of the subranges defined for this object. Free
        the returns list with [glib.slist.SList.free].
  */
  override atk.range.Range[] getSubRanges()
  {
    GSList* _cretval;
    _cretval = atk_value_get_sub_ranges(cast(AtkValue*)this._cPtr);
    auto _retval = gSListToD!(atk.range.Range, GidOwnership.Full)(cast(GSList*)_cretval);
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
  override void getValueAndText(out double value, out string text)
  {
    char* _text;
    atk_value_get_value_and_text(cast(AtkValue*)this._cPtr, cast(double*)&value, &_text);
    text = _text.fromCString(Yes.Free);
  }

  /**
      Sets the value of this object.
  
      Params:
        value = a #GValue which is the desired new accessible value.
      Returns: true if new value is successfully set, false otherwise.
  
      Deprecated: Since 2.12. Use [atk.value.Value.setValue] instead.
  */
  override bool setCurrentValue(gobject.value.Value value)
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
      
      Note for implementors: the deprecated [atk.value.Value.setCurrentValue]
      method returned TRUE or FALSE depending if the value was assigned
      or not. In the practice several implementors were not able to
      decide it, and returned TRUE in any case. For that reason it is not
      required anymore to return if the value was properly assigned or
      not.
  
      Params:
        newValue = a double which is the desired new accessible value.
  */
  override void setValue(double newValue)
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
  
          $(D void callback(double value, string text, atk.value.Value value))
  
          `value` the new value in a numerical form. (optional)
  
          `text` human readable text alternative (also called
          description) of this object. NULL if not available. (optional)
  
          `value` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : atk.value.Value)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }
}
