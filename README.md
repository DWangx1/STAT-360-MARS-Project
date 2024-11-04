# MARS (Multivariate Adaptive Regression Splines)

### Description
MARS is a regression modeling technique that creates continuous models with smooth derivatives. It is suitable for data with complex relationships and non-linear terms.
This repository is the final project for Simon Fraser University's STAT 360

### Usage
```R
mars(formula, data, control)

```

## Parameters

- **formula**: A formula object in the format `response ~ terms`, describing the model structure.
- **data**: A data frame or list containing the variables for the model.
- **control**: (Optional) A list containing parameters for model behavior:
  - `Mmax`: Maximum number of terms.
  - `d`: Degree of interaction.
  - `Trace`: Output control for model steps.
  
  Defaults are used if `control` is not specified.

---

## Process

1. **Model Frame Construction**: Builds a model frame using the provided `formula` and `data`.
2. **Design Matrix Creation**: Generates a design matrix to enable dummy variable handling.
3. **Forward Stepwise Selection**:
   - Selects product terms of hinge functions.
   - Creates a basis matrix and a list of splits for the model.
4. **Backward Stepwise Selection**:
   - Uses Generalized Cross Validation (LOF) to optimize and select the best basis functions.

---

## Output

The final model inherits from the `lm` object, with the output classified as `mars` to facilitate usage with linear modeling functions.

## Methods

- **print/summary**: Provides an overview of basis functions and splits.
- **plot**: Generates visual plots of the model components.
- **anova**: Performs ANOVA decomposition on the model.
- **predict**: Predicts responses for the model, including new data predictions.

---

## Return Value

`mars` returns an object with key components, including:

- `model formula`
- `basis matrix`
- `splits`
- `coefficients`
- `residuals`
- `fitted values`
- and more.

The output object inherits many properties from `lm`, such as `residuals`, `coefficients`, and `degrees of freedom`.
