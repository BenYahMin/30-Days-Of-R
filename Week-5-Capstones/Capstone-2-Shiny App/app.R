# ==============================================================================
# Week 5, Capstone 2: Shiny App
# 30-Days-Of-R
# Author: Benjamin Kithome
# ==============================================================================

# Load required libraries
library(shiny)
library(tidyverse)

# ------------------------------------------------------------------------------
# 1. Generate Baseline Underlying Mock Dataset
# ------------------------------------------------------------------------------
set.seed(5002)
n_projects <- 200

project_data <- tibble(
  project_id = 1001:(1000 + n_projects),
  department = sample(c("Engineering", "Marketing", "Sales", "Operations"), n_projects, replace = TRUE),
  budget_thousand_usd = round(runif(n_projects, min = 10, max = 150), 1),
  efficiency_score = round(runif(n_projects, min = 40, max = 100), 1)
) %>%
  mutate(
    # Introduce correlation: higher budget projects in engineering score slightly differently
    efficiency_score = if_else(department == "Engineering" & budget_thousand_usd > 80, 
                               pmin(efficiency_score + 10, 100), efficiency_score)
  )

# ------------------------------------------------------------------------------
# 2. User Interface Design Layout (UI)
# ------------------------------------------------------------------------------
ui <- fluidPage(
  # Application theme styling and title
  theme = if (requireNamespace("shinythemes", quietly = TRUE)) shinythemes::shinytheme("paper") else NULL,
  titlePanel("Corporate Operations Efficiency Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      p("Adjust filters below to evaluate operational efficiency profiles across funding ranges."),
      hr(),
      
      # Selector 1: Department Checkbox Filters
      checkboxGroupInput(
        inputId = "selected_depts",
        label = "Select Active Departments:",
        choices = c("Engineering", "Marketing", "Sales", "Operations"),
        selected = c("Engineering", "Marketing", "Sales", "Operations")
      ),
      
      br(),
      
      # Selector 2: Budget Range Slider
      sliderInput(
        inputId = "budget_range",
        label = "Project Budget Window ($k):",
        min = 10,
        max = 150,
        value = c(25, 125)
      )
    ),
    
    mainPanel(
      # Organized presentation panels
      tabsetPanel(
        tabPanel(
          title = "Efficiency Insights Plot", 
          br(),
          plotOutput(outputId = "efficiency_scatter")
        ),
        tabPanel(
          title = "Data Metrics Matrix", 
          br(),
          tableOutput(outputId = "summary_table")
        )
      )
    )
  )
)

# ------------------------------------------------------------------------------
# 3. Execution Processing Engine (Server)
# ------------------------------------------------------------------------------
server <- function(input, output, session) {
  
  # Reactive Data Pipeline: Filters dataset based on user input values.
  # This recalculates dynamically whenever any widget state shifts.
  filtered_data <- reactive({
    project_data %>%
      filter(
        department %in% input$selected_depts,
        budget_thousand_usd >= input$budget_range[1],
        budget_thousand_usd <= input$budget_range[2]
      )
  })
  
  # Rendering Milestone 1: Reactive Scatter Plot
  output$efficiency_scatter <- renderPlot({
    # Validate that at least one department is checked to prevent evaluation crash flags
    validate(
      need(length(input$selected_depts) > 0, "Please select at least one department branch to render visualization metrics.")
    )
    
    ggplot(filtered_data(), aes(x = budget_thousand_usd, y = efficiency_score, color = department)) +
      geom_point(size = 3.5, alpha = 0.75) +
      geom_smooth(method = "lm", formula = y ~ x, se = FALSE, linetype = "dashed", color = "#444444") +
      scale_color_brewer(palette = "Set1") +
      theme_minimal(base_size = 14) +
      labs(
        x = "Allocated Capital Funding Budget ($1k USD)",
        y = "Calculated Operational Efficiency Score (0-100)",
        color = "Department Focus"
      ) +
      theme(plot.title = element_text(face = "bold"), legend.position = "bottom")
  })
  
  # Rendering Milestone 2: Reactive Data Metrics Summary Table
  output$summary_table <- renderTable({
    # Validate data is present
    validate(
      need(nrow(filtered_data()) > 0, "No records match current parameters.")
    )
    
    filtered_data() %>%
      group_by(department) %>%
      summarise(
        Total_Active_Projects = n(),
        Mean_Budget_Thousands = mean(budget_thousand_usd),
        Median_Efficiency_Score = median(efficiency_score),
        .groups = "drop"
      )
  }, digits = 1)
}

# ------------------------------------------------------------------------------
# 4. Initialize Local App Runtime Call
# ------------------------------------------------------------------------------
shinyApp(ui = ui, server = server)