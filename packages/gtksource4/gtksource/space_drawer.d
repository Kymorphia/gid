/// Module for [SpaceDrawer] class
module gtksource.space_drawer;

import gid.gid;
import gio.settings;
import gio.types;
import glib.variant;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class SpaceDrawer : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_space_drawer_get_type != &gidSymbolNotFound ? gtk_source_space_drawer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpaceDrawer self()
  {
    return this;
  }

  /**
      Get `enableMatrix` property.
      Returns: Whether the #GtkSourceSpaceDrawer:matrix property is enabled.
  */
  @property bool enableMatrix()
  {
    return getEnableMatrix();
  }

  /**
      Set `enableMatrix` property.
      Params:
        propval = Whether the #GtkSourceSpaceDrawer:matrix property is enabled.
  */
  @property void enableMatrix(bool propval)
  {
    return setEnableMatrix(propval);
  }

  /**
      Get `matrix` property.
      Returns: The :matrix property is a #GVariant property to specify where and
      what kind of white spaces to draw.
      
      The #GVariant is of type `"au"`, an array of unsigned integers. Each
      integer is a combination of #GtkSourceSpaceTypeFlags. There is one
      integer for each #GtkSourceSpaceLocationFlags, in the same order as
      they are defined in the enum ([gtksource.types.SpaceLocationFlags.None] and
      [gtksource.types.SpaceLocationFlags.All] are not taken into account).
      
      If the array is shorter than the number of locations, then the value
      for the missing locations will be [gtksource.types.SpaceTypeFlags.None].
      
      By default, [gtksource.types.SpaceTypeFlags.All] is set for all locations.
  */
  @property glib.variant.Variant matrix()
  {
    return getMatrix();
  }

  /**
      Set `matrix` property.
      Params:
        propval = The :matrix property is a #GVariant property to specify where and
        what kind of white spaces to draw.
        
        The #GVariant is of type `"au"`, an array of unsigned integers. Each
        integer is a combination of #GtkSourceSpaceTypeFlags. There is one
        integer for each #GtkSourceSpaceLocationFlags, in the same order as
        they are defined in the enum ([gtksource.types.SpaceLocationFlags.None] and
        [gtksource.types.SpaceLocationFlags.All] are not taken into account).
        
        If the array is shorter than the number of locations, then the value
        for the missing locations will be [gtksource.types.SpaceTypeFlags.None].
        
        By default, [gtksource.types.SpaceTypeFlags.All] is set for all locations.
  */
  @property void matrix(glib.variant.Variant propval)
  {
    return setMatrix(propval);
  }

  /**
      Creates a new #GtkSourceSpaceDrawer object. Useful for storing space drawing
      settings independently of a #GtkSourceView.
      Returns: a new #GtkSourceSpaceDrawer.
  */
  this()
  {
    GtkSourceSpaceDrawer* _cretval;
    _cretval = gtk_source_space_drawer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Binds the #GtkSourceSpaceDrawer:matrix property to a #GSettings key.
      
      The #GSettings key must be of the same type as the
      #GtkSourceSpaceDrawer:matrix property, that is, `"au"`.
      
      The [gio.settings.Settings.bind] function cannot be used, because the default GIO
      mapping functions don't support #GVariant properties (maybe it will be
      supported by a future GIO version, in which case this function can be
      deprecated).
  
      Params:
        settings = a #GSettings object.
        key = the settings key to bind.
        flags = flags for the binding.
  */
  void bindMatrixSetting(gio.settings.Settings settings, string key, gio.types.SettingsBindFlags flags)
  {
    const(char)* _key = key.toCString(No.Alloc);
    gtk_source_space_drawer_bind_matrix_setting(cast(GtkSourceSpaceDrawer*)this._cPtr, settings ? cast(GSettings*)settings._cPtr(No.Dup) : null, _key, flags);
  }

  /** */
  bool getEnableMatrix()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_space_drawer_get_enable_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkSourceSpaceDrawer:matrix property, as a #GVariant.
      An empty array can be returned in case the matrix is a zero matrix.
      
      The [gtksource.space_drawer.SpaceDrawer.getTypesForLocations] function may be more
      convenient to use.
      Returns: the #GtkSourceSpaceDrawer:matrix value as a new floating #GVariant
          instance.
  */
  glib.variant.Variant getMatrix()
  {
    GVariant* _cretval;
    _cretval = gtk_source_space_drawer_get_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      If only one location is specified, this function returns what kind of
      white spaces are drawn at that location. The value is retrieved from the
      #GtkSourceSpaceDrawer:matrix property.
      
      If several locations are specified, this function returns the logical AND for
      those locations. Which means that if a certain kind of white space is present
      in the return value, then that kind of white space is drawn at all the
      specified locations.
  
      Params:
        locations = one or several #GtkSourceSpaceLocationFlags.
      Returns: a combination of #GtkSourceSpaceTypeFlags.
  */
  gtksource.types.SpaceTypeFlags getTypesForLocations(gtksource.types.SpaceLocationFlags locations)
  {
    GtkSourceSpaceTypeFlags _cretval;
    _cretval = gtk_source_space_drawer_get_types_for_locations(cast(GtkSourceSpaceDrawer*)this._cPtr, locations);
    gtksource.types.SpaceTypeFlags _retval = cast(gtksource.types.SpaceTypeFlags)_cretval;
    return _retval;
  }

  /**
      Sets whether the #GtkSourceSpaceDrawer:matrix property is enabled.
  
      Params:
        enableMatrix = the new value.
  */
  void setEnableMatrix(bool enableMatrix)
  {
    gtk_source_space_drawer_set_enable_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr, enableMatrix);
  }

  /**
      Sets a new value to the #GtkSourceSpaceDrawer:matrix property, as a
      #GVariant. If matrix is null, then an empty array is set.
      
      If matrix is floating, it is consumed.
      
      The [gtksource.space_drawer.SpaceDrawer.setTypesForLocations] function may be more
      convenient to use.
  
      Params:
        matrix = the new matrix value, or null.
  */
  void setMatrix(glib.variant.Variant matrix = null)
  {
    gtk_source_space_drawer_set_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr, matrix ? cast(GVariant*)matrix._cPtr(No.Dup) : null);
  }

  /**
      Modifies the #GtkSourceSpaceDrawer:matrix property at the specified
      locations.
  
      Params:
        locations = one or several #GtkSourceSpaceLocationFlags.
        types = a combination of #GtkSourceSpaceTypeFlags.
  */
  void setTypesForLocations(gtksource.types.SpaceLocationFlags locations, gtksource.types.SpaceTypeFlags types)
  {
    gtk_source_space_drawer_set_types_for_locations(cast(GtkSourceSpaceDrawer*)this._cPtr, locations, types);
  }
}
