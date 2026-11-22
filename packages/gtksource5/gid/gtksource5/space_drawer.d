/// Module for [SpaceDrawer] class
module gid.gtksource5.space_drawer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.settings;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Represent white space characters with symbols.
    
    #GtkSourceSpaceDrawer provides a way to visualize white spaces, by drawing
    symbols.
    
    Call [gid.gtksource5.view.View.getSpaceDrawer] to get the [gid.gtksource5.space_drawer.SpaceDrawer]
    instance of a certain [gid.gtksource5.view.View].
    
    By default, no white spaces are drawn because the
    [gid.gtksource5.space_drawer.SpaceDrawer.enableMatrix] is false.
    
    To draw white spaces, [gid.gtksource5.space_drawer.SpaceDrawer.setTypesForLocations] can
    be called to set the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property (by default all
    space types are enabled at all locations). Then call
    [gid.gtksource5.space_drawer.SpaceDrawer.setEnableMatrix].
    
    For a finer-grained method, there is also the [gid.gtksource5.tag.Tag]'s
    [gid.gtksource5.tag.Tag.drawSpaces] property.
    
    # Example
    
    To draw non-breaking spaces everywhere and draw all types of trailing spaces
    except newlines:
    ```c
    gtk_source_space_drawer_set_types_for_locations (space_drawer,
                                                     GTK_SOURCE_SPACE_LOCATION_ALL,
                                                     GTK_SOURCE_SPACE_TYPE_NBSP);
    
    gtk_source_space_drawer_set_types_for_locations (space_drawer,
                                                     GTK_SOURCE_SPACE_LOCATION_TRAILING,
                                                     GTK_SOURCE_SPACE_TYPE_ALL &
                                                     ~GTK_SOURCE_SPACE_TYPE_NEWLINE);
    
    gtk_source_space_drawer_set_enable_matrix (space_drawer, TRUE);
    ```
    ```python
    space_drawer.set_types_for_locations(
        locations=GtkSource.SpaceLocationFlags.ALL,
        types=GtkSource.SpaceTypeFlags.NBSP,
    )
    
    all_types_except_newline = GtkSource.SpaceTypeFlags(
        int(GtkSource.SpaceTypeFlags.ALL) & ~int(GtkSource.SpaceTypeFlags.NEWLINE)
    )
    space_drawer.set_types_for_locations(
        locations=GtkSource.SpaceLocationFlags.TRAILING,
        types=all_types_except_newline,
    )
    
    space_drawer.set_enable_matrix(True)
    ```
    
    # Use-case: draw unwanted white spaces
    
    A possible use-case is to draw only unwanted white spaces. Examples:
    
    - Draw all trailing spaces.
    - If the indentation and alignment must be done with spaces, draw tabs.
    
    And non-breaking spaces can always be drawn, everywhere, to distinguish them
    from normal spaces.
*/
class SpaceDrawer : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_space_drawer_get_type != &gidSymbolNotFound ? gtk_source_space_drawer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceSpaceDrawer";
  }

  /** Returns `this`, for use in `with` statements. */
  override SpaceDrawer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.space_drawer.SpaceDrawer]
      Returns: New builder object
  */
  static SpaceDrawerGidBuilder builder() nothrow
  {
    return new SpaceDrawerGidBuilder;
  }

  /**
      Get `enableMatrix` property.
      Returns: Whether the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property is enabled.
  */
  @property bool enableMatrix() nothrow
  {
    return getEnableMatrix();
  }

  /**
      Set `enableMatrix` property.
      Params:
        propval = Whether the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property is enabled.
  */
  @property void enableMatrix(bool propval) nothrow
  {
    setEnableMatrix(propval);
  }

  /**
      Get `matrix` property.
      Returns: The property is a [gid.glib2.variant.Variant] property to specify where and
        what kind of white spaces to draw.
        
        The [gid.glib2.variant.Variant] is of type `"au"`, an array of unsigned integers. Each
        integer is a combination of [gid.gtksource5.types.SpaceTypeFlags]. There is one
        integer for each [gid.gtksource5.types.SpaceLocationFlags], in the same order as
        they are defined in the enum ([gid.gtksource5.types.SpaceLocationFlags.None] and
        [gid.gtksource5.types.SpaceLocationFlags.All] are not taken into account).
        
        If the array is shorter than the number of locations, then the value
        for the missing locations will be [gid.gtksource5.types.SpaceTypeFlags.None].
        
        By default, [gid.gtksource5.types.SpaceTypeFlags.All] is set for all locations.4
  */
  @property gid.glib2.variant.Variant matrix() nothrow
  {
    return getMatrix();
  }

  /**
      Set `matrix` property.
      Params:
        propval = The property is a [gid.glib2.variant.Variant] property to specify where and
          what kind of white spaces to draw.
          
          The [gid.glib2.variant.Variant] is of type `"au"`, an array of unsigned integers. Each
          integer is a combination of [gid.gtksource5.types.SpaceTypeFlags]. There is one
          integer for each [gid.gtksource5.types.SpaceLocationFlags], in the same order as
          they are defined in the enum ([gid.gtksource5.types.SpaceLocationFlags.None] and
          [gid.gtksource5.types.SpaceLocationFlags.All] are not taken into account).
          
          If the array is shorter than the number of locations, then the value
          for the missing locations will be [gid.gtksource5.types.SpaceTypeFlags.None].
          
          By default, [gid.gtksource5.types.SpaceTypeFlags.All] is set for all locations.4
  */
  @property void matrix(gid.glib2.variant.Variant propval) nothrow
  {
    setMatrix(propval);
  }

  /**
      Creates a new #GtkSourceSpaceDrawer object.
      
      Useful for storing space drawing settings independently of a [gid.gtksource5.view.View].
      Returns: a new #GtkSourceSpaceDrawer.
  */
  this() nothrow
  {
    GtkSourceSpaceDrawer* _cretval;
    _cretval = gtk_source_space_drawer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Binds the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property to a [gid.gio2.settings.Settings] key.
      
      The [gid.gio2.settings.Settings] key must be of the same type as the
      [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property, that is, `"au"`.
      
      The [gid.gio2.settings.Settings.bind] function cannot be used, because the default GIO
      mapping functions don't support [gid.glib2.variant.Variant] properties (maybe it will be
      supported by a future GIO version, in which case this function can be
      deprecated).
  
      Params:
        settings = a #GSettings object.
        key = the settings key to bind.
        flags = flags for the binding.
  */
  void bindMatrixSetting(gid.gio2.settings.Settings settings, string key, gid.gio2.types.SettingsBindFlags flags) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    gtk_source_space_drawer_bind_matrix_setting(cast(GtkSourceSpaceDrawer*)this._cPtr, settings ? cast(GSettings*)settings._cPtr(No.Dup) : null, _key, flags);
  }

  /** */
  bool getEnableMatrix() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_space_drawer_get_enable_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property, as a [gid.glib2.variant.Variant].
      
      An empty array can be returned in case the matrix is a zero matrix.
      
      The [gid.gtksource5.space_drawer.SpaceDrawer.getTypesForLocations] function may be more
      convenient to use.
      Returns: the #GtkSourceSpaceDrawer:matrix value as a new floating #GVariant
          instance.
  */
  gid.glib2.variant.Variant getMatrix() nothrow
  {
    GVariant* _cretval;
    _cretval = gtk_source_space_drawer_get_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      If only one location is specified, this function returns what kind of
      white spaces are drawn at that location.
      
      The value is retrieved from the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property.
      
      If several locations are specified, this function returns the logical AND for
      those locations. Which means that if a certain kind of white space is present
      in the return value, then that kind of white space is drawn at all the
      specified locations.
  
      Params:
        locations = one or several #GtkSourceSpaceLocationFlags.
      Returns: a combination of #GtkSourceSpaceTypeFlags.
  */
  gid.gtksource5.types.SpaceTypeFlags getTypesForLocations(gid.gtksource5.types.SpaceLocationFlags locations) nothrow
  {
    GtkSourceSpaceTypeFlags _cretval;
    _cretval = gtk_source_space_drawer_get_types_for_locations(cast(GtkSourceSpaceDrawer*)this._cPtr, locations);
    gid.gtksource5.types.SpaceTypeFlags _retval = cast(gid.gtksource5.types.SpaceTypeFlags)_cretval;
    return _retval;
  }

  /**
      Sets whether the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property is enabled.
  
      Params:
        enableMatrix = the new value.
  */
  void setEnableMatrix(bool enableMatrix) nothrow
  {
    gtk_source_space_drawer_set_enable_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr, enableMatrix);
  }

  /**
      Sets a new value to the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property, as a [gid.glib2.variant.Variant].
      
      If matrix is null, then an empty array is set.
      
      If matrix is floating, it is consumed.
      
      The [gid.gtksource5.space_drawer.SpaceDrawer.setTypesForLocations] function may be more
      convenient to use.
  
      Params:
        matrix = the new matrix value, or null.
  */
  void setMatrix(gid.glib2.variant.Variant matrix = null) nothrow
  {
    gtk_source_space_drawer_set_matrix(cast(GtkSourceSpaceDrawer*)this._cPtr, matrix ? cast(GVariant*)matrix._cPtr(No.Dup) : null);
  }

  /**
      Modifies the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property at the specified
      locations.
  
      Params:
        locations = one or several #GtkSourceSpaceLocationFlags.
        types = a combination of #GtkSourceSpaceTypeFlags.
  */
  void setTypesForLocations(gid.gtksource5.types.SpaceLocationFlags locations, gid.gtksource5.types.SpaceTypeFlags types) nothrow
  {
    gtk_source_space_drawer_set_types_for_locations(cast(GtkSourceSpaceDrawer*)this._cPtr, locations, types);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.space_drawer.SpaceDrawer]
class SpaceDrawerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `enableMatrix` property.
      Params:
        propval = Whether the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property is enabled.
      Returns: Builder instance for fluent chaining
  */
  T enableMatrix(bool propval) nothrow
  {
    return setProperty("enable-matrix", propval);
  }

  /**
      Set `matrix` property.
      Params:
        propval = The property is a [gid.glib2.variant.Variant] property to specify where and
          what kind of white spaces to draw.
          
          The [gid.glib2.variant.Variant] is of type `"au"`, an array of unsigned integers. Each
          integer is a combination of [gid.gtksource5.types.SpaceTypeFlags]. There is one
          integer for each [gid.gtksource5.types.SpaceLocationFlags], in the same order as
          they are defined in the enum ([gid.gtksource5.types.SpaceLocationFlags.None] and
          [gid.gtksource5.types.SpaceLocationFlags.All] are not taken into account).
          
          If the array is shorter than the number of locations, then the value
          for the missing locations will be [gid.gtksource5.types.SpaceTypeFlags.None].
          
          By default, [gid.gtksource5.types.SpaceTypeFlags.All] is set for all locations.4
      Returns: Builder instance for fluent chaining
  */
  T matrix(gid.glib2.variant.Variant propval) nothrow
  {
    return setProperty("matrix", propval);
  }
}

/// Fluent builder for [gid.gtksource5.space_drawer.SpaceDrawer]
final class SpaceDrawerGidBuilder : SpaceDrawerGidBuilderImpl!SpaceDrawerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SpaceDrawer build() nothrow
  {
    return new SpaceDrawer(cast(void*)createGObject(SpaceDrawer._getGType), Yes.Take);
  }
}
