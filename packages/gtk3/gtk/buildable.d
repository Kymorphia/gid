/// Module for [Buildable] interface
module gtk.buildable;

public import gtk.buildable_iface_proxy;
import gid.gid;
import glib.types;
import gobject.gid_builder;
import gobject.object;
import gobject.value;
import gtk.builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

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
interface Buildable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_buildable_get_type != &gidSymbolNotFound ? gtk_buildable_get_type() : cast(GType)0;
  }

  /**
      Adds a child to buildable. type is an optional string
      describing how the child should be added.
  
      Params:
        builder = a #GtkBuilder
        child = child to add
        type = kind of child or null
  */
  void addChild(gtk.builder.Builder builder, gobject.object.ObjectWrap child, string type = null);

  /**
      Constructs a child of buildable with the name name.
      
      #GtkBuilder calls this function if a “constructor” has been
      specified in the UI definition.
  
      Params:
        builder = #GtkBuilder used to construct this object
        name = name of child to construct
      Returns: the constructed child
  */
  gobject.object.ObjectWrap constructChild(gtk.builder.Builder builder, string name);

  /**
      This is similar to [gtk.buildable.Buildable.parserFinished] but is
      called once for each custom tag handled by the buildable.
  
      Params:
        builder = a #GtkBuilder
        child = child object or null for non-child tags
        tagname = the name of the tag
        data = user data created in custom_tag_start
  */
  void customFinished(gtk.builder.Builder builder, gobject.object.ObjectWrap child, string tagname, void* data = null);

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
  bool customTagStart(gtk.builder.Builder builder, gobject.object.ObjectWrap child, string tagname, out glib.types.MarkupParser parser, out void* data);

  /**
      Get the internal child called childname of the buildable object.
  
      Params:
        builder = a #GtkBuilder
        childname = name of child
      Returns: the internal child of the buildable object
  */
  gobject.object.ObjectWrap getInternalChild(gtk.builder.Builder builder, string childname);

  /**
      Gets the name of the buildable object.
      
      #GtkBuilder sets the name based on the
      [GtkBuilder UI definition][BUILDER-UI]
      used to construct the buildable.
      Returns: the name set with [gtk.buildable.Buildable.setName]
  */
  string getName();

  /**
      Called when the builder finishes the parsing of a
      [GtkBuilder UI definition][BUILDER-UI].
      Note that this will be called once for each time
      [gtk.builder.Builder.addFromFile] or [gtk.builder.Builder.addFromString]
      is called on a builder.
  
      Params:
        builder = a #GtkBuilder
  */
  void parserFinished(gtk.builder.Builder builder);

  /**
      Sets the property name name to value on the buildable object.
  
      Params:
        builder = a #GtkBuilder
        name = name of property
        value = value of property
  */
  void setBuildableProperty(gtk.builder.Builder builder, string name, gobject.value.Value value);

  /**
      Sets the name of the buildable object.
  
      Params:
        name = name to set
  */
  void setName(string name);
}

interface BuildableGidBuilderImpl(T)
{
}
