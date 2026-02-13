import lume from "lume/mod.ts";
import blog from "blog/mod.ts";
import * as fs from "node:fs";
// import transformImages from "lume/plugins/transform_images.ts";

const site = lume({
    location: new URL("https://youredeadfilm.com"),
});

// site.use(transformImages());
site.use(blog());

site.add("css");
site.add("assets");

export default site;
