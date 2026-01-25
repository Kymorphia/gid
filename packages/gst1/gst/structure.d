/// Module for [Structure] class
module gst.structure;

import gid.gid;
import glib.date;
import glib.types;
import gobject.boxed;
import gobject.types;
import gobject.value;
import gobject.value_array;
import gst.c.functions;
import gst.c.types;
import gst.date_time;
import gst.types;

/**
    A #GstStructure is a collection of key/value pairs. The keys are expressed as
    GQuarks and the values can be of any GType.
    
    In addition to the key/value pairs, a #GstStructure also has a name. The name
    starts with a letter and can be filled by letters, numbers and any of
    "/-_.:".
    
    #GstStructure is used by various GStreamer subsystems to store information in
    a flexible and extensible way. A #GstStructure does not have a refcount
    because it usually is part of a higher level object such as #GstCaps,
    #GstMessage, #GstEvent, #GstQuery. It provides a means to enforce mutability
    using the refcount of the parent with the [gst.structure.Structure.setParentRefcount]
    method.
    
    A #GstStructure can be created with [gst.structure.Structure.newEmpty] or
    [gst.structure.Structure.new_], which both take a name and an optional set of key/value
    pairs along with the types of the values.
    
    Field values can be changed with [gst.structure.Structure.setValue] or
    [gst.structure.Structure.set].
    
    Field values can be retrieved with [gst.structure.Structure.getValue] or the more
    convenient gst_structure_get_*() functions.
    
    Fields can be removed with [gst.structure.Structure.removeField] or
    [gst.structure.Structure.removeFields].
    
    Strings in structures must be ASCII or UTF-8 encoded. Other encodings are not
    allowed. Strings may be null however.
    
    ## The serialization format
    
    GstStructure serialization format serialize the GstStructure name,
    keys/GType/values in a comma separated list with the structure name as first
    field without value followed by separated key/value pairs in the form
    `key=value`, for example:
    
    ```
    a-structure, key=value
    ````
    
    The values type will be inferred if not explicitly specified with the
    `(GTypeName)value` syntax, for example the following struct will have one
    field called 'is-string' which has the string 'true' as a value:
    
    ```
    a-struct, field-is-string=(string)true, field-is-boolean=true
    ```
    
    *Note*: without specifying `(string), `field-is-string` type would have been
    inferred as boolean.
    
    *Note*: we specified `(string)` as a type even if `gchararray` is the actual
    GType name as for convenience some well known types have been aliased or
    abbreviated.
    
    To avoid specifying the type, you can give some hints to the "type system".
    For example to specify a value as a double, you should add a decimal (ie. `1`
    is an [harfbuzz.types.int] while `1.0` is a `double`).
    
    *Note*: when a structure is serialized with #gst_structure_to_string, all
    values are explicitly typed.
    
    Some types have special delimiters:
    
    $(LIST
      * [GstValueArray](GST_TYPE_ARRAY) are inside curly brackets (`{` and `}`).
        For example `a-structure, array={1, 2, 3}`
      * Ranges are inside brackets (`[` and `]`). For example `a-structure,
        range=[1, 6, 2]` 1 being the min value, 6 the maximum and 2 the step. To
        specify a #GST_TYPE_INT64_RANGE you need to explicitly specify it like:
        `a-structure, a-int64-range=(gint64) [1, 5]`
      * [GstValueList](GST_TYPE_LIST) are inside "less and greater than" (`<` and
        `>`). For example `a-structure, list=<1, 2, 3>
    )
      
    Structures are delimited either by a null character `\0` or a semicolon `;`
    the latter allowing to store multiple structures in the same string (see
    #GstCaps).
    
    Quotes are used as "default" delimiters and can be used around any types that
    don't use other delimiters (for example `a-struct, i=(int)"1"`). They are use
    to allow adding spaces or special characters (such as delimiters,
    semicolumns, etc..) inside strings and you can use backslashes `\` to escape
    characters inside them, for example:
    
    ```
    a-struct, special="\"{[(;)]}\" can be used inside quotes"
    ```
    
    They also allow for nested structure, such as:
    
    ```
    a-struct, nested=(GstStructure)"nested-struct, nested=true"
    ```
    
    Since 1.20, nested structures and caps can be specified using brackets (`[`
    and `]`), for example:
    
    ```
    a-struct, nested=[nested-struct, nested=true]
    ```
    
    > *note*: [gst.structure.Structure.toString_] won't use that syntax for backward
    > compatibility reason, [gst.structure.Structure.serializeFull] has been added for
    > that purpose.
*/
class Structure : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_structure_get_type != &gidSymbolNotFound ? gst_structure_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Structure self()
  {
    return this;
  }

  /**
      Get `type` field.
      Returns: the GType of a structure
  */
  @property gobject.types.GType type()
  {
    return (cast(GstStructure*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the GType of a structure
  */
  @property void type(gobject.types.GType propval)
  {
    (cast(GstStructure*)this._cPtr).type = propval;
  }

  /**
      Creates a #GstStructure from a string representation.
      If end is not null, a pointer to the place inside the given string
      where parsing ended will be returned.
      
      Free-function: gst_structure_free
  
      Params:
        string_ = a string representation of a #GstStructure.
        end = pointer to store the end of the string in.
      Returns: a new #GstStructure or null
            when the string could not be parsed. Free with
            [gst.structure.Structure.free] after use.
  */
  static gst.structure.Structure fromString(string string_, out string end)
  {
    GstStructure* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    char* _end;
    _cretval = gst_structure_from_string(_string_, &_end);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    end = _end.fromCString(No.Free);
    return _retval;
  }

  /**
      Creates a new, empty #GstStructure with the given name.
      
      See [gst.structure.Structure.setName] for constraints on the name parameter.
      
      Free-function: gst_structure_free
  
      Params:
        name = name of new structure
      Returns: a new, empty #GstStructure
  */
  static gst.structure.Structure newEmpty(string name)
  {
    GstStructure* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_structure_new_empty(_name);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a #GstStructure from a string representation.
      If end is not null, a pointer to the place inside the given string
      where parsing ended will be returned.
      
      The current implementation of serialization will lead to unexpected results
      when there are nested #GstCaps / #GstStructure deeper than one level unless
      the [gst.structure.Structure.serialize] function is used (without
      #GST_SERIALIZE_FLAG_BACKWARD_COMPAT)
      
      Free-function: gst_structure_free
  
      Params:
        string_ = a string representation of a #GstStructure
      Returns: a new #GstStructure or null
            when the string could not be parsed. Free with
            [gst.structure.Structure.free] after use.
  */
  static gst.structure.Structure newFromString(string string_)
  {
    GstStructure* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gst_structure_new_from_string(_string_);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new, empty #GstStructure with the given name as a GQuark.
      
      Free-function: gst_structure_free
  
      Params:
        quark = name of new structure
      Returns: a new, empty #GstStructure
  */
  static gst.structure.Structure newIdEmpty(glib.types.Quark quark)
  {
    GstStructure* _cretval;
    _cretval = gst_structure_new_id_empty(quark);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Tries intersecting struct1 and struct2 and reports whether the result
      would not be empty.
  
      Params:
        struct2 = a #GstStructure
      Returns: true if intersection would not be empty
  */
  bool canIntersect(gst.structure.Structure struct2)
  {
    bool _retval;
    _retval = cast(bool)gst_structure_can_intersect(cast(const(GstStructure)*)this._cPtr, struct2 ? cast(const(GstStructure)*)struct2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Duplicates a #GstStructure and all its fields and values.
      
      Free-function: gst_structure_free
      Returns: a new #GstStructure.
  */
  gst.structure.Structure copy()
  {
    GstStructure* _cretval;
    _cretval = gst_structure_copy(cast(const(GstStructure)*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls the provided function once for each field in the #GstStructure. In
      contrast to [gst.structure.Structure.foreach_], the function may modify the fields.
      In contrast to [gst.structure.Structure.mapInPlace], the field is removed from
      the structure if false is returned from the function.
      The structure must be mutable.
  
      Params:
        func = a function to call for each field
  */
  void filterAndMapInPlace(gst.types.StructureFilterMapFunc func)
  {
    extern(C) gboolean _funcCallback(GQuark fieldId, GValue* value, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.StructureFilterMapFunc*)userData;

      _dretval = (*_dlg)(fieldId, value ? new gobject.value.Value(cast(void*)value, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gst_structure_filter_and_map_in_place(cast(GstStructure*)this._cPtr, _funcCB, _func);
  }

  /**
      Fixate all values in structure using [gst.global.valueFixate].
      structure will be modified in-place and should be writable.
  */
  void fixate()
  {
    gst_structure_fixate(cast(GstStructure*)this._cPtr);
  }

  /**
      Fixates a #GstStructure by changing the given field with its fixated value.
  
      Params:
        fieldName = a field in structure
      Returns: true if the structure field could be fixated
  */
  bool fixateField(string fieldName)
  {
    bool _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_fixate_field(cast(GstStructure*)this._cPtr, _fieldName);
    return _retval;
  }

  /**
      Fixates a #GstStructure by changing the given field_name field to the given
      target boolean if that field is not fixed yet.
  
      Params:
        fieldName = a field in structure
        target = the target value of the fixation
      Returns: true if the structure could be fixated
  */
  bool fixateFieldBoolean(string fieldName, bool target)
  {
    bool _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_fixate_field_boolean(cast(GstStructure*)this._cPtr, _fieldName, target);
    return _retval;
  }

  /**
      Fixates a #GstStructure by changing the given field to the nearest
      double to target that is a subset of the existing field.
  
      Params:
        fieldName = a field in structure
        target = the target value of the fixation
      Returns: true if the structure could be fixated
  */
  bool fixateFieldNearestDouble(string fieldName, double target)
  {
    bool _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_fixate_field_nearest_double(cast(GstStructure*)this._cPtr, _fieldName, target);
    return _retval;
  }

  /**
      Fixates a #GstStructure by changing the given field to the nearest
      fraction to target_numerator/target_denominator that is a subset
      of the existing field.
  
      Params:
        fieldName = a field in structure
        targetNumerator = The numerator of the target value of the fixation
        targetDenominator = The denominator of the target value of the fixation
      Returns: true if the structure could be fixated
  */
  bool fixateFieldNearestFraction(string fieldName, int targetNumerator, int targetDenominator)
  {
    bool _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_fixate_field_nearest_fraction(cast(GstStructure*)this._cPtr, _fieldName, targetNumerator, targetDenominator);
    return _retval;
  }

  /**
      Fixates a #GstStructure by changing the given field to the nearest
      integer to target that is a subset of the existing field.
  
      Params:
        fieldName = a field in structure
        target = the target value of the fixation
      Returns: true if the structure could be fixated
  */
  bool fixateFieldNearestInt(string fieldName, int target)
  {
    bool _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_fixate_field_nearest_int(cast(GstStructure*)this._cPtr, _fieldName, target);
    return _retval;
  }

  /**
      Fixates a #GstStructure by changing the given field_name field to the given
      target string if that field is not fixed yet.
  
      Params:
        fieldName = a field in structure
        target = the target value of the fixation
      Returns: true if the structure could be fixated
  */
  bool fixateFieldString(string fieldName, string target)
  {
    bool _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    const(char)* _target = target.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_fixate_field_string(cast(GstStructure*)this._cPtr, _fieldName, _target);
    return _retval;
  }

  /**
      Calls the provided function once for each field in the #GstStructure. The
      function must not modify the fields. Also see [gst.structure.Structure.mapInPlace]
      and [gst.structure.Structure.filterAndMapInPlace].
  
      Params:
        func = a function to call for each field
      Returns: true if the supplied function returns true For each of the fields,
        false otherwise.
  */
  bool foreach_(gst.types.StructureForeachFunc func)
  {
    extern(C) gboolean _funcCallback(GQuark fieldId, const(GValue)* value, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.StructureForeachFunc*)userData;

      _dretval = (*_dlg)(fieldId, value ? new gobject.value.Value(cast(void*)value, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_structure_foreach(cast(const(GstStructure)*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      This is useful in language bindings where unknown #GValue types are not
      supported. This function will convert the `GST_TYPE_ARRAY` into a newly
      allocated #GValueArray and return it through array. Be aware that this is
      slower then getting the #GValue directly.
  
      Params:
        fieldname = the name of a field
        array = a pointer to a #GValueArray
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a `GST_TYPE_ARRAY`,
        this function returns false.
  */
  bool getArray(string fieldname, out gobject.value_array.ValueArray array)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    GValueArray* _array;
    _retval = cast(bool)gst_structure_get_array(cast(GstStructure*)this._cPtr, _fieldname, &_array);
    array = new gobject.value_array.ValueArray(cast(void*)_array, Yes.Take);
    return _retval;
  }

  /**
      Sets the boolean pointed to by value corresponding to the value of the
      given field.  Caller is responsible for making sure the field exists
      and has the correct type.
  
      Params:
        fieldname = the name of a field
        value = a pointer to a #gboolean to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a boolean, this
        function returns false.
  */
  bool getBoolean(string fieldname, out bool value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    gboolean _value;
    _retval = cast(bool)gst_structure_get_boolean(cast(const(GstStructure)*)this._cPtr, _fieldname, &_value);
    value = cast(bool)_value;
    return _retval;
  }

  /**
      Sets the clock time pointed to by value corresponding to the clock time
      of the given field.  Caller is responsible for making sure the field exists
      and has the correct type.
  
      Params:
        fieldname = the name of a field
        value = a pointer to a #GstClockTime to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a #GstClockTime, this
        function returns false.
  */
  bool getClockTime(string fieldname, out gst.types.ClockTime value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_clock_time(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(GstClockTime*)&value);
    return _retval;
  }

  /**
      Sets the date pointed to by value corresponding to the date of the
      given field.  Caller is responsible for making sure the field exists
      and has the correct type.
      
      On success value will point to a newly-allocated copy of the date which
      should be freed with [glib.date.Date.free] when no longer needed (note: this is
      inconsistent with e.g. [gst.structure.Structure.getString] which doesn't return a
      copy of the string).
  
      Params:
        fieldname = the name of a field
        value = a pointer to a #GDate to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a data, this function
        returns false.
  */
  bool getDate(string fieldname, out glib.date.Date value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    GDate* _value;
    _retval = cast(bool)gst_structure_get_date(cast(const(GstStructure)*)this._cPtr, _fieldname, &_value);
    value = *cast(Date*)_value;
    return _retval;
  }

  /**
      Sets the datetime pointed to by value corresponding to the datetime of the
      given field. Caller is responsible for making sure the field exists
      and has the correct type.
      
      On success value will point to a reference of the datetime which
      should be unreffed with [gst.date_time.DateTime.unref] when no longer needed
      (note: this is inconsistent with e.g. [gst.structure.Structure.getString]
      which doesn't return a copy of the string).
  
      Params:
        fieldname = the name of a field
        value = a pointer to a #GstDateTime to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a data, this function
        returns false.
  */
  bool getDateTime(string fieldname, out gst.date_time.DateTime value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    GstDateTime* _value;
    _retval = cast(bool)gst_structure_get_date_time(cast(const(GstStructure)*)this._cPtr, _fieldname, &_value);
    value = new gst.date_time.DateTime(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Sets the double pointed to by value corresponding to the value of the
      given field.  Caller is responsible for making sure the field exists
      and has the correct type.
  
      Params:
        fieldname = the name of a field
        value = a pointer to a gdouble to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a double, this
        function returns false.
  */
  bool getDouble(string fieldname, out double value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_double(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(double*)&value);
    return _retval;
  }

  /**
      Sets the int pointed to by value corresponding to the value of the
      given field.  Caller is responsible for making sure the field exists,
      has the correct type and that the enumtype is correct.
  
      Params:
        fieldname = the name of a field
        enumtype = the enum type of a field
        value = a pointer to an int to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain an enum of the given
        type, this function returns false.
  */
  bool getEnum(string fieldname, gobject.types.GType enumtype, out int value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_enum(cast(const(GstStructure)*)this._cPtr, _fieldname, enumtype, cast(int*)&value);
    return _retval;
  }

  /**
      Finds the field with the given name, and returns the type of the
      value it contains.  If the field is not found, G_TYPE_INVALID is
      returned.
  
      Params:
        fieldname = the name of the field
      Returns: the #GValue of the field
  */
  gobject.types.GType getFieldType(string fieldname)
  {
    gobject.types.GType _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = gst_structure_get_field_type(cast(const(GstStructure)*)this._cPtr, _fieldname);
    return _retval;
  }

  /**
      Sets the unsigned int pointed to by value corresponding to the value of the
      given field. Caller is responsible for making sure the field exists,
      has the correct type and that the flagstype is correct.
  
      Params:
        fieldname = the name of a field
        flagsType = the flags type of a field
        value = a pointer to an unsigned int to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain flags or
        did not contain flags of the given type, this function returns false.
  */
  bool getFlags(string fieldname, gobject.types.GType flagsType, out uint value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_flags(cast(const(GstStructure)*)this._cPtr, _fieldname, flagsType, cast(uint*)&value);
    return _retval;
  }

  /**
      Read the GstFlagSet flags and mask out of the structure into the
      provided pointers.
  
      Params:
        fieldname = the name of a field
        valueFlags = a pointer to a guint for the flags field
        valueMask = a pointer to a guint for the mask field
      Returns: true if the values could be set correctly. If there was no field
        with fieldname or the existing field did not contain a GstFlagSet, this
        function returns false.
  */
  bool getFlagset(string fieldname, out uint valueFlags, out uint valueMask)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_flagset(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(uint*)&valueFlags, cast(uint*)&valueMask);
    return _retval;
  }

  /**
      Sets the integers pointed to by value_numerator and value_denominator
      corresponding to the value of the given field.  Caller is responsible
      for making sure the field exists and has the correct type.
  
      Params:
        fieldname = the name of a field
        valueNumerator = a pointer to an int to set
        valueDenominator = a pointer to an int to set
      Returns: true if the values could be set correctly. If there was no field
        with fieldname or the existing field did not contain a GstFraction, this
        function returns false.
  */
  bool getFraction(string fieldname, out int valueNumerator, out int valueDenominator)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_fraction(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(int*)&valueNumerator, cast(int*)&valueDenominator);
    return _retval;
  }

  /**
      Sets the int pointed to by value corresponding to the value of the
      given field.  Caller is responsible for making sure the field exists
      and has the correct type.
  
      Params:
        fieldname = the name of a field
        value = a pointer to an int to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain an int, this function
        returns false.
  */
  bool getInt(string fieldname, out int value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_int(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(int*)&value);
    return _retval;
  }

  /**
      Sets the #gint64 pointed to by value corresponding to the value of the
      given field. Caller is responsible for making sure the field exists
      and has the correct type.
  
      Params:
        fieldname = the name of a field
        value = a pointer to a #gint64 to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a #gint64, this function
        returns false.
  */
  bool getInt64(string fieldname, out long value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_int64(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(long*)&value);
    return _retval;
  }

  /**
      This is useful in language bindings where unknown #GValue types are not
      supported. This function will convert the `GST_TYPE_LIST` into a newly
      allocated GValueArray and return it through array. Be aware that this is
      slower then getting the #GValue directly.
  
      Params:
        fieldname = the name of a field
        array = a pointer to a #GValueArray
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a `GST_TYPE_LIST`, this
        function returns false.
  */
  bool getList(string fieldname, out gobject.value_array.ValueArray array)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    GValueArray* _array;
    _retval = cast(bool)gst_structure_get_list(cast(GstStructure*)this._cPtr, _fieldname, &_array);
    array = new gobject.value_array.ValueArray(cast(void*)_array, Yes.Take);
    return _retval;
  }

  /**
      Get the name of structure as a string.
      Returns: the name of the structure.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gst_structure_get_name(cast(const(GstStructure)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the name of structure as a GQuark.
      Returns: the quark representing the name of the structure.
  */
  glib.types.Quark getNameId()
  {
    glib.types.Quark _retval;
    _retval = gst_structure_get_name_id(cast(const(GstStructure)*)this._cPtr);
    return _retval;
  }

  /**
      Finds the field corresponding to fieldname, and returns the string
      contained in the field's value.  Caller is responsible for making
      sure the field exists and has the correct type.
      
      The string should not be modified, and remains valid until the next
      call to a gst_structure_*() function with the given structure.
  
      Params:
        fieldname = the name of a field
      Returns: a pointer to the string or null when the
        field did not exist or did not contain a string.
  */
  string getString(string fieldname)
  {
    const(char)* _cretval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _cretval = gst_structure_get_string(cast(const(GstStructure)*)this._cPtr, _fieldname);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the uint pointed to by value corresponding to the value of the
      given field.  Caller is responsible for making sure the field exists
      and has the correct type.
  
      Params:
        fieldname = the name of a field
        value = a pointer to a uint to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a uint, this function
        returns false.
  */
  bool getUint(string fieldname, out uint value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_uint(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(uint*)&value);
    return _retval;
  }

  /**
      Sets the #guint64 pointed to by value corresponding to the value of the
      given field. Caller is responsible for making sure the field exists
      and has the correct type.
  
      Params:
        fieldname = the name of a field
        value = a pointer to a #guint64 to set
      Returns: true if the value could be set correctly. If there was no field
        with fieldname or the existing field did not contain a #guint64, this function
        returns false.
  */
  bool getUint64(string fieldname, out ulong value)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_get_uint64(cast(const(GstStructure)*)this._cPtr, _fieldname, cast(ulong*)&value);
    return _retval;
  }

  /**
      Get the value of the field with name fieldname.
  
      Params:
        fieldname = the name of the field to get
      Returns: the #GValue corresponding to the field with the given
        name.
  */
  gobject.value.Value getValue(string fieldname)
  {
    const(GValue)* _cretval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _cretval = gst_structure_get_value(cast(const(GstStructure)*)this._cPtr, _fieldname);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Check if structure contains a field named fieldname.
  
      Params:
        fieldname = the name of a field
      Returns: true if the structure contains a field with the given name
  */
  bool hasField(string fieldname)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_has_field(cast(const(GstStructure)*)this._cPtr, _fieldname);
    return _retval;
  }

  /**
      Check if structure contains a field named fieldname and with GType type.
  
      Params:
        fieldname = the name of a field
        type = the type of a value
      Returns: true if the structure contains a field with the given name and type
  */
  bool hasFieldTyped(string fieldname, gobject.types.GType type)
  {
    bool _retval;
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_has_field_typed(cast(const(GstStructure)*)this._cPtr, _fieldname, type);
    return _retval;
  }

  /**
      Checks if the structure has the given name
  
      Params:
        name = structure name to check for
      Returns: true if name matches the name of the structure.
  */
  bool hasName(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_structure_has_name(cast(const(GstStructure)*)this._cPtr, _name);
    return _retval;
  }

  /**
      Get the value of the field with GQuark field.
  
      Params:
        field = the #GQuark of the field to get
      Returns: the #GValue corresponding to the field with the given
        name identifier.
  */
  gobject.value.Value idGetValue(glib.types.Quark field)
  {
    const(GValue)* _cretval;
    _cretval = gst_structure_id_get_value(cast(const(GstStructure)*)this._cPtr, field);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Check if structure contains a field named field.
  
      Params:
        field = #GQuark of the field name
      Returns: true if the structure contains a field with the given name
  */
  bool idHasField(glib.types.Quark field)
  {
    bool _retval;
    _retval = cast(bool)gst_structure_id_has_field(cast(const(GstStructure)*)this._cPtr, field);
    return _retval;
  }

  /**
      Check if structure contains a field named field and with GType type.
  
      Params:
        field = #GQuark of the field name
        type = the type of a value
      Returns: true if the structure contains a field with the given name and type
  */
  bool idHasFieldTyped(glib.types.Quark field, gobject.types.GType type)
  {
    bool _retval;
    _retval = cast(bool)gst_structure_id_has_field_typed(cast(const(GstStructure)*)this._cPtr, field, type);
    return _retval;
  }

  /**
      Sets the field with the given GQuark field to value.  If the field
      does not exist, it is created.  If the field exists, the previous
      value is replaced and freed.
  
      Params:
        field = a #GQuark representing a field
        value = the new value of the field
  */
  void idSetValue(glib.types.Quark field, gobject.value.Value value)
  {
    gst_structure_id_set_value(cast(GstStructure*)this._cPtr, field, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the field with the given GQuark field to value.  If the field
      does not exist, it is created.  If the field exists, the previous
      value is replaced and freed.
  
      Params:
        field = a #GQuark representing a field
        value = the new value of the field
  */
  void idTakeValue(glib.types.Quark field, gobject.value.Value value)
  {
    gst_structure_id_take_value(cast(GstStructure*)this._cPtr, field, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Intersects struct1 and struct2 and returns the intersection.
  
      Params:
        struct2 = a #GstStructure
      Returns: Intersection of struct1 and struct2
  */
  gst.structure.Structure intersect(gst.structure.Structure struct2)
  {
    GstStructure* _cretval;
    _cretval = gst_structure_intersect(cast(const(GstStructure)*)this._cPtr, struct2 ? cast(const(GstStructure)*)struct2._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Tests if the two #GstStructure are equal.
  
      Params:
        structure2 = a #GstStructure.
      Returns: true if the two structures have the same name and field.
  */
  bool isEqual(gst.structure.Structure structure2)
  {
    bool _retval;
    _retval = cast(bool)gst_structure_is_equal(cast(const(GstStructure)*)this._cPtr, structure2 ? cast(const(GstStructure)*)structure2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if subset is a subset of superset, i.e. has the same
      structure name and for all fields that are existing in superset,
      subset has a value that is a subset of the value in superset.
  
      Params:
        superset = a potentially greater #GstStructure
      Returns: true if subset is a subset of superset
  */
  bool isSubset(gst.structure.Structure superset)
  {
    bool _retval;
    _retval = cast(bool)gst_structure_is_subset(cast(const(GstStructure)*)this._cPtr, superset ? cast(const(GstStructure)*)superset._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls the provided function once for each field in the #GstStructure. In
      contrast to [gst.structure.Structure.foreach_], the function may modify but not delete the
      fields. The structure must be mutable.
  
      Params:
        func = a function to call for each field
      Returns: true if the supplied function returns true For each of the fields,
        false otherwise.
  */
  bool mapInPlace(gst.types.StructureMapFunc func)
  {
    extern(C) gboolean _funcCallback(GQuark fieldId, GValue* value, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.StructureMapFunc*)userData;

      _dretval = (*_dlg)(fieldId, value ? new gobject.value.Value(cast(void*)value, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_structure_map_in_place(cast(GstStructure*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Get the number of fields in the structure.
      Returns: the number of fields in the structure
  */
  int nFields()
  {
    int _retval;
    _retval = gst_structure_n_fields(cast(const(GstStructure)*)this._cPtr);
    return _retval;
  }

  /**
      Get the name of the given field number, counting from 0 onwards.
  
      Params:
        index = the index to get the name of
      Returns: the name of the given field number
  */
  string nthFieldName(uint index)
  {
    const(char)* _cretval;
    _cretval = gst_structure_nth_field_name(cast(const(GstStructure)*)this._cPtr, index);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Removes all fields in a GstStructure.
  */
  void removeAllFields()
  {
    gst_structure_remove_all_fields(cast(GstStructure*)this._cPtr);
  }

  /**
      Removes the field with the given name.  If the field with the given
      name does not exist, the structure is unchanged.
  
      Params:
        fieldname = the name of the field to remove
  */
  void removeField(string fieldname)
  {
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    gst_structure_remove_field(cast(GstStructure*)this._cPtr, _fieldname);
  }

  /**
      Converts structure to a human-readable string representation.
      
      This version of the caps serialization function introduces support for nested
      structures and caps but the resulting strings won't be parsable with
      GStreamer prior to 1.20 unless #GST_SERIALIZE_FLAG_BACKWARD_COMPAT is passed
      as flag.
      
      [gst.types.SerializeFlags.Strict] flags is not allowed because it would make this
      function nullable which is an API break for bindings.
      Use [gst.structure.Structure.serializeFull] instead.
      
      Free-function: g_free
  
      Params:
        flags = The flags to use to serialize structure
      Returns: a pointer to string allocated by [glib.global.gmalloc].
            [glib.global.gfree] after usage.
  
      Deprecated: Use [gst.structure.Structure.serializeFull] instead.
  */
  string serialize(gst.types.SerializeFlags flags)
  {
    char* _cretval;
    _cretval = gst_structure_serialize(cast(const(GstStructure)*)this._cPtr, flags);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Alias for [gst.structure.Structure.serialize] but with nullable annotation because it
      can return null when [gst.types.SerializeFlags.Strict] flag is set.
  
      Params:
        flags = The flags to use to serialize structure
      Returns: a pointer to string allocated by [glib.global.gmalloc].
            [glib.global.gfree] after usage.
  */
  string serializeFull(gst.types.SerializeFlags flags)
  {
    char* _cretval;
    _cretval = gst_structure_serialize_full(cast(const(GstStructure)*)this._cPtr, flags);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      This is useful in language bindings where unknown GValue types are not
      supported. This function will convert a array to `GST_TYPE_ARRAY` and set
      the field specified by fieldname.  Be aware that this is slower then using
      `GST_TYPE_ARRAY` in a #GValue directly.
  
      Params:
        fieldname = the name of a field
        array = a pointer to a #GValueArray
  */
  void setArray(string fieldname, gobject.value_array.ValueArray array)
  {
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    gst_structure_set_array(cast(GstStructure*)this._cPtr, _fieldname, array ? cast(const(GValueArray)*)array._cPtr(No.Dup) : null);
  }

  /**
      This is useful in language bindings where unknown GValue types are not
      supported. This function will convert a array to `GST_TYPE_LIST` and set
      the field specified by fieldname. Be aware that this is slower then using
      `GST_TYPE_LIST` in a #GValue directly.
  
      Params:
        fieldname = the name of a field
        array = a pointer to a #GValueArray
  */
  void setList(string fieldname, gobject.value_array.ValueArray array)
  {
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    gst_structure_set_list(cast(GstStructure*)this._cPtr, _fieldname, array ? cast(const(GValueArray)*)array._cPtr(No.Dup) : null);
  }

  /**
      Sets the name of the structure to the given name.  The string
      provided is copied before being used. It must not be empty, start with a
      letter and can be followed by letters, numbers and any of "/-_.:".
  
      Params:
        name = the new name of the structure
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_structure_set_name(cast(GstStructure*)this._cPtr, _name);
  }

  /**
      Sets the field with the given name field to value.  If the field
      does not exist, it is created.  If the field exists, the previous
      value is replaced and freed.
  
      Params:
        fieldname = the name of the field to set
        value = the new value of the field
  */
  void setValue(string fieldname, gobject.value.Value value)
  {
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    gst_structure_set_value(cast(GstStructure*)this._cPtr, _fieldname, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the field with the given name field to value.  If the field
      does not exist, it is created.  If the field exists, the previous
      value is replaced and freed. The function will take ownership of value.
  
      Params:
        fieldname = the name of the field to set
        value = the new value of the field
  */
  void takeValue(string fieldname, gobject.value.Value value)
  {
    const(char)* _fieldname = fieldname.toCString(No.Alloc);
    gst_structure_take_value(cast(GstStructure*)this._cPtr, _fieldname, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Converts structure to a human-readable string representation.
      
      For debugging purposes its easier to do something like this: ```<!--
      language="C" --> GST_LOG ("structure is %" GST_PTR_FORMAT, structure);
      ```
      This prints the structure in human readable form.
      
      This function will lead to unexpected results when there are nested #GstCaps
      / #GstStructure deeper than one level, you should user
      gst_structure_serialize_full() instead for those cases.
      
      Free-function: g_free
      Returns: a pointer to string allocated by [glib.global.gmalloc].
            [glib.global.gfree] after usage.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_structure_to_string(cast(const(GstStructure)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Atomically modifies a pointer to point to a new structure.
      The #GstStructure oldstr_ptr is pointing to is freed and
      newstr is taken ownership over.
      
      Either newstr and the value pointed to by oldstr_ptr may be null.
      
      It is a programming error if both newstr and the value pointed to by
      oldstr_ptr refer to the same, non-null structure.
  
      Params:
        oldstrPtr = pointer to a place of
              a #GstStructure to take
        newstr = a new #GstStructure
      Returns: true if newstr was different from oldstr_ptr
  */
  static bool take(gst.structure.Structure oldstrPtr = null, gst.structure.Structure newstr = null)
  {
    bool _retval;
    _retval = cast(bool)gst_structure_take(oldstrPtr ? cast(GstStructure**)oldstrPtr._cPtr(No.Dup) : null, newstr ? cast(GstStructure*)newstr._cPtr(Yes.Dup) : null);
    return _retval;
  }
}
