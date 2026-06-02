/// Module for [Position] class
module panel.position;

public import gid.basictypes;
import gid.gid;
import glib.variant;
import gobject.gid_builder;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/**
    Specifies a position in the dock. You receive a #PanelPosition in the
    handler to `signal@PanelDock::create-frame`.
*/
class Position : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_position_get_type != &gidSymbolNotFound ? panel_position_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Position self() nothrow
  {
    return this;
  }

  /**
      Get builder for [panel.position.Position]
      Returns: New builder object
  */
  static PositionGidBuilder builder() nothrow
  {
    return new PositionGidBuilder;
  }

  /**
      Get `area` property.
      Returns: The area.
  */
  @property panel.types.Area area() nothrow
  {
    return getArea();
  }

  /**
      Set `area` property.
      Params:
        propval = The area.
  */
  @property void area(panel.types.Area propval) nothrow
  {
    setArea(propval);
  }

  /**
      Get `areaSet` property.
      Returns: The area is set.
  */
  @property bool areaSet() nothrow
  {
    return getAreaSet();
  }

  /**
      Set `areaSet` property.
      Params:
        propval = The area is set.
  */
  @property void areaSet(bool propval) nothrow
  {
    setAreaSet(propval);
  }

  /**
      Get `column` property.
      Returns: The column in the position.
  */
  @property uint column() nothrow
  {
    return getColumn();
  }

  /**
      Set `column` property.
      Params:
        propval = The column in the position.
  */
  @property void column(uint propval) nothrow
  {
    setColumn(propval);
  }

  /**
      Get `columnSet` property.
      Returns: The column is set.
  */
  @property bool columnSet() nothrow
  {
    return getColumnSet();
  }

  /**
      Set `columnSet` property.
      Params:
        propval = The column is set.
  */
  @property void columnSet(bool propval) nothrow
  {
    setColumnSet(propval);
  }

  /** */
  @property uint depth() nothrow
  {
    return getDepth();
  }

  /** */
  @property void depth(uint propval) nothrow
  {
    setDepth(propval);
  }

  /** */
  @property bool depthSet() nothrow
  {
    return getDepthSet();
  }

  /** */
  @property void depthSet(bool propval) nothrow
  {
    setDepthSet(propval);
  }

  /** */
  @property uint row() nothrow
  {
    return getRow();
  }

  /** */
  @property void row(uint propval) nothrow
  {
    setRow(propval);
  }

  /** */
  @property bool rowSet() nothrow
  {
    return getRowSet();
  }

  /** */
  @property void rowSet(bool propval) nothrow
  {
    setRowSet(propval);
  }

  /**
      Create a position.
      Returns: a newly created instance of #PanelPosition.
  */
  this() nothrow
  {
    PanelPosition* _cretval;
    _cretval = panel_position_new();
    this(_cretval, Yes.Take);
  }

  /**
      Create a #PanelPosition from a #GVariant.
  
      Params:
        variant = a #GVariant
      Returns: A newly created #PanelPosition
          from the #GVariant.
  */
  static panel.position.Position newFromVariant(glib.variant.Variant variant) nothrow
  {
    PanelPosition* _cretval;
    _cretval = panel_position_new_from_variant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.position.Position)(cast(PanelPosition*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Compares two #PanelPosition.
  
      Params:
        b = another #PanelPosition
      Returns: whether the two pane positions are equal.
  */
  bool equal(panel.position.Position b) nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_position_equal(cast(PanelPosition*)this._cPtr, b ? cast(PanelPosition*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the area.
      Returns: the area.
  */
  panel.types.Area getArea() nothrow
  {
    PanelArea _cretval;
    _cretval = panel_position_get_area(cast(PanelPosition*)this._cPtr);
    panel.types.Area _retval = cast(panel.types.Area)_cretval;
    return _retval;
  }

  /**
      Gets wether the area is set.
      Returns: the wether the area is set.
  */
  bool getAreaSet() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_position_get_area_set(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /** */
  uint getColumn() nothrow
  {
    uint _retval;
    _retval = panel_position_get_column(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /** */
  bool getColumnSet() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_position_get_column_set(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /** */
  uint getDepth() nothrow
  {
    uint _retval;
    _retval = panel_position_get_depth(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /** */
  bool getDepthSet() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_position_get_depth_set(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /** */
  uint getRow() nothrow
  {
    uint _retval;
    _retval = panel_position_get_row(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /** */
  bool getRowSet() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_position_get_row_set(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /**
      Tells is the position is indeterminate.
      Returns: whether the position is indeterminate.
  */
  bool isIndeterminate() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_position_is_indeterminate(cast(PanelPosition*)this._cPtr);
    return _retval;
  }

  /**
      Sets the area.
  
      Params:
        area = the #PanelArea
  */
  void setArea(panel.types.Area area) nothrow
  {
    panel_position_set_area(cast(PanelPosition*)this._cPtr, area);
  }

  /**
      Sets whether the area is set.
  
      Params:
        areaSet = whether the area is set.
  */
  void setAreaSet(bool areaSet) nothrow
  {
    panel_position_set_area_set(cast(PanelPosition*)this._cPtr, areaSet);
  }

  /** */
  void setColumn(uint column) nothrow
  {
    panel_position_set_column(cast(PanelPosition*)this._cPtr, column);
  }

  /** */
  void setColumnSet(bool columnSet) nothrow
  {
    panel_position_set_column_set(cast(PanelPosition*)this._cPtr, columnSet);
  }

  /** */
  void setDepth(uint depth) nothrow
  {
    panel_position_set_depth(cast(PanelPosition*)this._cPtr, depth);
  }

  /** */
  void setDepthSet(bool depthSet) nothrow
  {
    panel_position_set_depth_set(cast(PanelPosition*)this._cPtr, depthSet);
  }

  /** */
  void setRow(uint row) nothrow
  {
    panel_position_set_row(cast(PanelPosition*)this._cPtr, row);
  }

  /** */
  void setRowSet(bool rowSet) nothrow
  {
    panel_position_set_row_set(cast(PanelPosition*)this._cPtr, rowSet);
  }

  /**
      Convert a #PanelPosition to a #GVariant.
      Returns: the new #GVariant containing
        the positon values
  */
  glib.variant.Variant toVariant() nothrow
  {
    GVariant* _cretval;
    _cretval = panel_position_to_variant(cast(PanelPosition*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [panel.position.Position]
class PositionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `area` property.
      Params:
        propval = The area.
      Returns: Builder instance for fluent chaining
  */
  T area(panel.types.Area propval) nothrow
  {
    return setProperty("area", propval);
  }

  /**
      Set `areaSet` property.
      Params:
        propval = The area is set.
      Returns: Builder instance for fluent chaining
  */
  T areaSet(bool propval) nothrow
  {
    return setProperty("area-set", propval);
  }

  /**
      Set `column` property.
      Params:
        propval = The column in the position.
      Returns: Builder instance for fluent chaining
  */
  T column(uint propval) nothrow
  {
    return setProperty("column", propval);
  }

  /**
      Set `columnSet` property.
      Params:
        propval = The column is set.
      Returns: Builder instance for fluent chaining
  */
  T columnSet(bool propval) nothrow
  {
    return setProperty("column-set", propval);
  }

  /** */
  T depth(uint propval) nothrow
  {
    return setProperty("depth", propval);
  }

  /** */
  T depthSet(bool propval) nothrow
  {
    return setProperty("depth-set", propval);
  }

  /** */
  T row(uint propval) nothrow
  {
    return setProperty("row", propval);
  }

  /** */
  T rowSet(bool propval) nothrow
  {
    return setProperty("row-set", propval);
  }
}

/// Fluent builder for [panel.position.Position]
final class PositionGidBuilder : PositionGidBuilderImpl!PositionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Position build() nothrow
  {
    return new Position(cast(void*)createGObject(Position._getGType), Yes.Take);
  }
}
