/// Module for [Buildable] interface mixin
module gtk.buildable_mixin;

public import gtk.buildable_iface_proxy;
public import gid.gid;
public import glib.types;
public import gobject.object;
public import gobject.value;
public import gtk.builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    GtkBuildable allows objects to extend and customize their deserialization
    from [GtkBuilder UI descriptions][BUILDER-UI].
    The interface includes methods for setting names and properties of objects,
    parsing custom tags and constructing child objects.
    
    The GtkBuildable interface is implemented by all widgets and
    many of the non-widget objects that are provided by GTK+. The
    main user of this interface is #GtkBuilder. There should be
    very little need for applications to call any of these functions directly.
    
    An object only needs to implement this interface if it needs to extend the
    #GtkBuilder format or run any extra routines at deserialization time.
*/
template BuildableT()
{

  /**
      Adds a child to buildable. type is an optional string
      describing how the child should be added.
  
      Params:
        builder = a #GtkBuilder
        child = child to add
        type = kind of child or null
  */
  override void addChild(gtk.builder.Builder builder, gobject.object.ObjectWrap child, string type = null)
  {
    const(char)* _type = type.toCString(No.Alloc);
    gtk_buildable_add_child(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _type);
  }

  /**
      Constructs a child of buildable with the name name.
      
      #GtkBuilder calls this function if a “constructor” has been
      specified in the UI definition.
  
      Params:
        builder = #GtkBuilder used to construct this object
        name = name of child to construct
      Returns: the constructed child
  */
  override gobject.object.ObjectWrap constructChild(gtk.builder.Builder builder, string name)
  {
    GObject* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_buildable_construct_child(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is similar to [gtk.buildable.Buildable.parserFinished] but is
      called once for each custom tag handled by the buildable.
  
      Params:
        builder = a #GtkBuilder
        child = child object or null for non-child tags
        tagname = the name of the tag
        data = user data created in custom_tag_start
  */
  override void customFinished(gtk.builder.Builder builder, gobject.object.ObjectWrap child, string tagname, void* data = null)
  {
    const(char)* _tagname = tagname.toCString(No.Alloc);
    gtk_buildable_custom_finished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, data);
  }

  /**
      This is called for each unknown element under `<child>`.
  
      Params:
        builder = a #GtkBuilder used to construct this object
        child = child object or null for non-child tags
        tagname = name of tag
        parser = a #GMarkupParser to fill in
        data = return location for user data that will be passed in
            to parser functions
      Returns: true if a object has a custom implementation, false
                 if it doesn't.
  */
  override bool customTagStart(gtk.builder.Builder builder, gobject.object.ObjectWrap child, string tagname, out glib.types.MarkupParser parser, out void* data)
  {
    bool _retval;
    const(char)* _tagname = tagname.toCString(No.Alloc);
    _retval = cast(bool)gtk_buildable_custom_tag_start(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, child ? cast(GObject*)child._cPtr(No.Dup) : null, _tagname, &parser, cast(void**)&data);
    return _retval;
  }

  /**
      Get the internal child called childname of the buildable object.
  
      Params:
        builder = a #GtkBuilder
        childname = name of child
      Returns: the internal child of the buildable object
  */
  override gobject.object.ObjectWrap getInternalChild(gtk.builder.Builder builder, string childname)
  {
    GObject* _cretval;
    const(char)* _childname = childname.toCString(No.Alloc);
    _cretval = gtk_buildable_get_internal_child(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _childname);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the buildable object.
      
      #GtkBuilder sets the name based on the
      [GtkBuilder UI definition][BUILDER-UI]
      used to construct the buildable.
      Returns: the name set with [gtk.buildable.Buildable.setName]
  */
  override string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_buildable_get_name(cast(GtkBuildable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Called when the builder finishes the parsing of a
      [GtkBuilder UI definition][BUILDER-UI].
      Note that this will be called once for each time
      [gtk.builder.Builder.addFromFile] or [gtk.builder.Builder.addFromString]
      is called on a builder.
  
      Params:
        builder = a #GtkBuilder
  */
  override void parserFinished(gtk.builder.Builder builder)
  {
    gtk_buildable_parser_finished(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null);
  }

  /**
      Sets the property name name to value on the buildable object.
  
      Params:
        builder = a #GtkBuilder
        name = name of property
        value = value of property
  */
  override void setBuildableProperty(gtk.builder.Builder builder, string name, gobject.value.Value value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_buildable_set_buildable_property(cast(GtkBuildable*)this._cPtr, builder ? cast(GtkBuilder*)builder._cPtr(No.Dup) : null, _name, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the name of the buildable object.
  
      Params:
        name = name to set
  */
  override void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_buildable_set_name(cast(GtkBuildable*)this._cPtr, _name);
  }
}
