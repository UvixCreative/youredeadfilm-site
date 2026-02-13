import lume from "lume/mod.ts";
import blog from "blog/mod.ts";
import googleFonts from "lume/plugins/google_fonts.ts";
// import transformImages from "lume/plugins/transform_images.ts";

const site = lume({
    location: new URL("https://youredeadfilm.com"),
});

// site.use(transformImages());
site.use(blog());
site.use(googleFonts({
  fonts:
    "https://fonts.googleapis.com/css2?family=Courier+Prime:ital,wght@0,400;0,700;1,400;1,700&display=swap",
}));

site.add("css");
site.add("assets");

export default site;
