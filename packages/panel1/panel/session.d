module panel.session;

import gid.gid;
import glib.error;
import glib.variant;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.session_item;
import panel.types;

/** */
class Session : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_session_get_type != &gidSymbolNotFound ? panel_session_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Session self()
  {
    return this;
  }

  /** */
  this()
  {
    PanelSession* _cretval;
    _cretval = panel_session_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #PanelSession from a #GVariant.
      
      This creates a new #PanelSession instance from a previous session
      which had been serialized to variant.
  
      Params:
        variant = a #GVariant from [panel.session.Session.toVariant]
      Returns: a #PanelSession
  */
  static panel.session.Session newFromVariant(glib.variant.VariantG variant)
  {
    PanelSession* _cretval;
    GError *_err;
    _cretval = panel_session_new_from_variant(variant ? cast(VariantC*)variant.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(panel.session.Session)(cast(PanelSession*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void append(panel.session_item.SessionItem item)
  {
    panel_session_append(cast(PanelSession*)cPtr, item ? cast(PanelSessionItem*)item.cPtr(No.Dup) : null);
  }

  /**
      Gets the item at position.
  
      Params:
        position = the index of the item
      Returns: The #PanelSessionItem at position
          or null if there is no item at that position.
  */
  panel.session_item.SessionItem getItem(uint position)
  {
    PanelSessionItem* _cretval;
    _cretval = panel_session_get_item(cast(PanelSession*)cPtr, position);
    auto _retval = ObjectG.getDObject!(panel.session_item.SessionItem)(cast(PanelSessionItem*)_cretval, No.Take);
    return _retval;
  }

  /** */
  uint getNItems()
  {
    uint _retval;
    _retval = panel_session_get_n_items(cast(PanelSession*)cPtr);
    return _retval;
  }

  /** */
  void insert(uint position, panel.session_item.SessionItem item)
  {
    panel_session_insert(cast(PanelSession*)cPtr, position, item ? cast(PanelSessionItem*)item.cPtr(No.Dup) : null);
  }

  /**
      Gets a session item matching id.
  
      Params:
        id = the id of the item
      Returns: an #PanelSessionItem or null
  */
  panel.session_item.SessionItem lookupById(string id)
  {
    PanelSessionItem* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = panel_session_lookup_by_id(cast(PanelSession*)cPtr, _id);
    auto _retval = ObjectG.getDObject!(panel.session_item.SessionItem)(cast(PanelSessionItem*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void prepend(panel.session_item.SessionItem item)
  {
    panel_session_prepend(cast(PanelSession*)cPtr, item ? cast(PanelSessionItem*)item.cPtr(No.Dup) : null);
  }

  /** */
  void remove(panel.session_item.SessionItem item)
  {
    panel_session_remove(cast(PanelSession*)cPtr, item ? cast(PanelSessionItem*)item.cPtr(No.Dup) : null);
  }

  /** */
  void removeAt(uint position)
  {
    panel_session_remove_at(cast(PanelSession*)cPtr, position);
  }

  /**
      Serializes a #PanelSession as a #GVariant
      
      The result of this function may be passed to
      [panel.session.Session.newFromVariant] to recreate a #PanelSession.
      
      The resulting variant will not be floating.
      Returns: a #GVariant
  */
  glib.variant.VariantG toVariant()
  {
    VariantC* _cretval;
    _cretval = panel_session_to_variant(cast(PanelSession*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
