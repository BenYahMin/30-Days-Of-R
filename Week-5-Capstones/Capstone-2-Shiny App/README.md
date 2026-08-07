# Week 5, Capstone 2: Building an Interactive Shiny App

Welcome to the second Capstone project of Week 5! Today, we take our static and interactive visualization skillsets to their peak by building a live dashboard using **Shiny**. Shiny is an R package that makes it incredibly straightforward to build interactive web apps directly from R code without needing HTML, CSS, or JavaScript.

## Core Milestones Covered
* **The Architecture of Shiny**: Mastering the relationship between the User Interface (`ui`) layout and the execution logic Engine (`server`).
* **Reactive Programming**: Using `reactive()` expressions to ensure data tables recalculate *only* when inputs change, maximizing efficiency.
* **Dynamic Widget Inputs**: Implementing text queries, numeric sliders, and dropdown selectors to let clients control the active dataset constraints.
* **Output Renderers**: Wiring up interactive execution wrappers (`renderPlot`, `renderTable`) to display changes on screen instantaneously.

---

## The Shiny Reactive Data Flow

```text
    [ User Inputs ]  ---->  [ Reactive Calculations ]  ---->  [ Render Output Components ]
  (Sliders, Dropdowns)       (Subsetting & Filtering)          (Plots, Data Summary Matrices)