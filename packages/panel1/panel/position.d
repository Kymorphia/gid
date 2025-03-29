module panel.position;

import gid.gid;
import glib.variant;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.types;

/**
    Specifies a position in the dock. You receive a #PanelPosition in the
    handler to `signal@PanelDock::create-frame`.
*/
class Position : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_position_get_type != &gidSymbolNotFound ? panel_position_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Position self()
  {
    return this;
  }

  /**
      Create a position.
      Returns: a newly created instance of #PanelPosition.
  */
  this()
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
  static panel.position.Position newFromVariant(glib.variant.VariantG variant)
  {
    PanelPosition* _cretval;
    _cretval = panel_position_new_from_variant(variant ? cast(VariantC*)variant.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(panel.position.Position)(cast(PanelPosition*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Compares two #PanelPosition.
  
      Params:
        b = another #PanelPosition
      Returns: whether the two pane positions are equal.
  */
  bool equal(panel.position.Position b)
  {
    bool _retval;
    _retval = panel_position_equal(cast(PanelPosition*)cPtr, b ? cast(PanelPosition*)b.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the area.
      Returns: the area.
  */
  panel.types.Area getArea()
  {
    PanelArea _cretval;
    _cretval = panel_position_get_area(cast(PanelPosition*)cPtr);
    panel.types.Area _retval = cast(panel.types.Area)_cretval;
    return _retval;
  }

  /**
      Gets wether the area is set.
      Returns: the wether the area is set.
  */
  bool getAreaSet()
  {
    bool _retval;
    _retval = panel_position_get_area_set(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /** */
  uint getColumn()
  {
    uint _retval;
    _retval = panel_position_get_column(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /** */
  bool getColumnSet()
  {
    bool _retval;
    _retval = panel_position_get_column_set(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /** */
  uint getDepth()
  {
    uint _retval;
    _retval = panel_position_get_depth(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /** */
  bool getDepthSet()
  {
    bool _retval;
    _retval = panel_position_get_depth_set(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /** */
  uint getRow()
  {
    uint _retval;
    _retval = panel_position_get_row(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /** */
  bool getRowSet()
  {
    bool _retval;
    _retval = panel_position_get_row_set(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /**
      Tells is the position is indeterminate.
      Returns: whether the position is indeterminate.
  */
  bool isIndeterminate()
  {
    bool _retval;
    _retval = panel_position_is_indeterminate(cast(PanelPosition*)cPtr);
    return _retval;
  }

  /**
      Sets the area.
  
      Params:
        area = the #PanelArea
  */
  void setArea(panel.types.Area area)
  {
    panel_position_set_area(cast(PanelPosition*)cPtr, area);
  }

  /**
      Sets whether the area is set.
  
      Params:
        areaSet = whether the area is set.
  */
  void setAreaSet(bool areaSet)
  {
    panel_position_set_area_set(cast(PanelPosition*)cPtr, areaSet);
  }

  /** */
  void setColumn(uint column)
  {
    panel_position_set_column(cast(PanelPosition*)cPtr, column);
  }

  /** */
  void setColumnSet(bool columnSet)
  {
    panel_position_set_column_set(cast(PanelPosition*)cPtr, columnSet);
  }

  /** */
  void setDepth(uint depth)
  {
    panel_position_set_depth(cast(PanelPosition*)cPtr, depth);
  }

  /** */
  void setDepthSet(bool depthSet)
  {
    panel_position_set_depth_set(cast(PanelPosition*)cPtr, depthSet);
  }

  /** */
  void setRow(uint row)
  {
    panel_position_set_row(cast(PanelPosition*)cPtr, row);
  }

  /** */
  void setRowSet(bool rowSet)
  {
    panel_position_set_row_set(cast(PanelPosition*)cPtr, rowSet);
  }

  /**
      Convert a #PanelPosition to a #GVariant.
      Returns: the new #GVariant containing
        the positon values
  */
  glib.variant.VariantG toVariant()
  {
    VariantC* _cretval;
    _cretval = panel_position_to_variant(cast(PanelPosition*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
