/// Module for [Session] class
module panel.session;

import gid.gid;
import glib.error;
import glib.variant;
import gobject.gid_builder;
import gobject.object;
import panel.c.functions;
import panel.c.types;
import panel.session_item;
import panel.types;

/** */
class Session : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_session_get_type != &gidSymbolNotFound ? panel_session_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Session self()
  {
    return this;
  }

  /**
      Get builder for [panel.session.Session]
      Returns: New builder object
  */
  static SessionGidBuilder builder()
  {
    return new SessionGidBuilder;
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
      Throws: [ErrorWrap]
  */
  static panel.session.Session newFromVariant(glib.variant.Variant variant)
  {
    PanelSession* _cretval;
    GError *_err;
    _cretval = panel_session_new_from_variant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.session.Session)(cast(PanelSession*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void append(panel.session_item.SessionItem item)
  {
    panel_session_append(cast(PanelSession*)this._cPtr, item ? cast(PanelSessionItem*)item._cPtr(No.Dup) : null);
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
    _cretval = panel_session_get_item(cast(PanelSession*)this._cPtr, position);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.session_item.SessionItem)(cast(PanelSessionItem*)_cretval, No.Take);
    return _retval;
  }

  /** */
  uint getNItems()
  {
    uint _retval;
    _retval = panel_session_get_n_items(cast(PanelSession*)this._cPtr);
    return _retval;
  }

  /** */
  void insert(uint position, panel.session_item.SessionItem item)
  {
    panel_session_insert(cast(PanelSession*)this._cPtr, position, item ? cast(PanelSessionItem*)item._cPtr(No.Dup) : null);
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
    _cretval = panel_session_lookup_by_id(cast(PanelSession*)this._cPtr, _id);
    auto _retval = gobject.object.ObjectWrap._getDObject!(panel.session_item.SessionItem)(cast(PanelSessionItem*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void prepend(panel.session_item.SessionItem item)
  {
    panel_session_prepend(cast(PanelSession*)this._cPtr, item ? cast(PanelSessionItem*)item._cPtr(No.Dup) : null);
  }

  /** */
  void remove(panel.session_item.SessionItem item)
  {
    panel_session_remove(cast(PanelSession*)this._cPtr, item ? cast(PanelSessionItem*)item._cPtr(No.Dup) : null);
  }

  /** */
  void removeAt(uint position)
  {
    panel_session_remove_at(cast(PanelSession*)this._cPtr, position);
  }

  /**
      Serializes a #PanelSession as a #GVariant
      
      The result of this function may be passed to
      [panel.session.Session.newFromVariant] to recreate a #PanelSession.
      
      The resulting variant will not be floating.
      Returns: a #GVariant
  */
  glib.variant.Variant toVariant()
  {
    GVariant* _cretval;
    _cretval = panel_session_to_variant(cast(PanelSession*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [panel.session.Session]
class SessionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [panel.session.Session]
final class SessionGidBuilder : SessionGidBuilderImpl!SessionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Session build()
  {
    return new Session(cast(void*)createGObject(Session._getGType), Yes.Take);
  }
}
