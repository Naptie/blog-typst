
#import "/typ/templates/mod.typ": sys-is-html-target

#let self-desc = [
  This is part of the PhiZone blog site specifically for articles written in Typst.

  #link("https://github.com/PhiZone")[GitHub]/#link("https://www.phi.zone")[PhiZone]. Donate via #link("https://patreon.com/naptie")[Patreon]/#link("https://afdian.com/a/naptie")[爱发电].
]

#if sys-is-html-target {
  {
    show raw: it => html.elem("style", it.text)
    ```css
    .self-desc {
      display: flex;
      flex-direction: row;
      gap: 4em;
      margin-block-start: -1em;
    }

    .self-desc .thumbnail-container {
      flex: 0 0 22em;
      border-radius: 0.5em;
      overflow: hidden;
    }

    .self-desc .thumbnail-container,
    .self-desc .thumbnail {
      width: 22em;
      height: 22em;
    }

    .thumbnail {
      --thumbnail-fg: var(--main-color);
      --thumbnail-bg: transparent;
    }

    .dark .thumbnail {
      --thumbnail-bg: var(--main-color);
      --thumbnail-fg: transparent;
    }

    @media (max-width: 800px) {
      .self-desc {
        flex-direction: column;
        align-items: center;
      }
      .self-desc .thumbnail-container,
      .self-desc .thumbnail {
        width: 100%;
        height: 100%;
      }
    }
    ```
  }

  let div = html.elem.with("div")
  let img = html.elem.with("img")
  div(
    attrs: (
      class: "self-desc",
    ),
    {
      div(self-desc)
      div(
        attrs: (
          class: "thumbnail-container link",
          title: "Artwork by ほし (@hoshi_u3)",
          onclick: "location.href='https://x.com/hoshi_u3/status/1925520435975999573'",
        ),
        img(
          attrs: (
            class: "thumbnail",
            src: "https://res.phizone.cn/mdx3fTueBBIOondCSFoMUpHsiX23crpM/avatar.png"
          ),
        ),
      )
    },
  )
} else {
  self-desc
}
