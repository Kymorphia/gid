/// Module for [Session] class
module gid.panel1.session;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.session_item;
import gid.panel1.types;

/** */
class Session : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_session_get_type != &gidSymbolNotFound ? panel_session_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelSession";
  }

  /** Returns `this`, for use in `with` statements. */
  override Session self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.session.Session]
      Returns: New builder object
  */
  static SessionGidBuilder builder() nothrow
  {
    return new SessionGidBuilder;
  }

  /** */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      PanelSession* _cretval;
      _cretval = panel_session_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new #PanelSession from a #GVariant.
      
      This creates a new #PanelSession instance from a previous session
      which had been serialized to variant.
  
      Params:
        variant = a #GVariant from [gid.panel1.session.Session.toVariant]
      Returns: a #PanelSession
      Throws: [ErrorWrap]
  */
  static gid.panel1.session.Session newFromVariant(gid.glib2.variant.Variant variant)
  {
    PanelSession* _cretval;
    GError *_err;
    _cretval = panel_session_new_from_variant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.session.Session)(cast(PanelSession*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void append(gid.panel1.session_item.SessionItem item) nothrow
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
  gid.panel1.session_item.SessionItem getItem(uint position) nothrow
  {
    PanelSessionItem* _cretval;
    _cretval = panel_session_get_item(cast(PanelSession*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.session_item.SessionItem)(cast(PanelSessionItem*)_cretval, No.Take);
    return _retval;
  }

  /** */
  uint getNItems() nothrow
  {
    uint _retval;
    _retval = panel_session_get_n_items(cast(PanelSession*)this._cPtr);
    return _retval;
  }

  /** */
  void insert(uint position, gid.panel1.session_item.SessionItem item) nothrow
  {
    panel_session_insert(cast(PanelSession*)this._cPtr, position, item ? cast(PanelSessionItem*)item._cPtr(No.Dup) : null);
  }

  /**
      Gets a session item matching id.
  
      Params:
        id = the id of the item
      Returns: an #PanelSessionItem or null
  */
  gid.panel1.session_item.SessionItem lookupById(string id) nothrow
  {
    PanelSessionItem* _cretval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _cretval = panel_session_lookup_by_id(cast(PanelSession*)this._cPtr, _id);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.session_item.SessionItem)(cast(PanelSessionItem*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void prepend(gid.panel1.session_item.SessionItem item) nothrow
  {
    panel_session_prepend(cast(PanelSession*)this._cPtr, item ? cast(PanelSessionItem*)item._cPtr(No.Dup) : null);
  }

  /** */
  void remove(gid.panel1.session_item.SessionItem item) nothrow
  {
    panel_session_remove(cast(PanelSession*)this._cPtr, item ? cast(PanelSessionItem*)item._cPtr(No.Dup) : null);
  }

  /** */
  void removeAt(uint position) nothrow
  {
    panel_session_remove_at(cast(PanelSession*)this._cPtr, position);
  }

  /**
      Serializes a #PanelSession as a #GVariant
      
      The result of this function may be passed to
      [gid.panel1.session.Session.newFromVariant] to recreate a #PanelSession.
      
      The resulting variant will not be floating.
      Returns: a #GVariant
  */
  gid.glib2.variant.Variant toVariant() nothrow
  {
    GVariant* _cretval;
    _cretval = panel_session_to_variant(cast(PanelSession*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.panel1.session.Session]
class SessionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.panel1.session.Session]
final class SessionGidBuilder : SessionGidBuilderImpl!SessionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Session build() nothrow
  {
    return new Session(cast(void*)createGObject(Session._getGType), Yes.Take);
  }
}
