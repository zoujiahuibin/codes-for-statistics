# The introduction of MAT LAB codes for time series

## estimate_AR.m

This is a MATLAB code to solve AR(p)  model. The AR(p) model is shown as
$$
y_t=\mu+\phi_1y_{t-1}+\phi_2y_{t-2}+...+\phi_py_{t-p}+\epsilon_t.
$$
The function in this file is 

```matlab
[phihat,sigma2hat]=estimate_AR(p,y,muexist),
```

where 

- muexist is a bool value, TRUE means the expectation of y is not zeors in AR(p) model, and FALSE otherwise;

- p is the parameter in AR(p);

- y is a column vector of data sorted by time increasingly;

- phihat=[mu, phi1,phi2] if muexist=TRUE and  phihat=[phi1,phi2] otherwise;

- sigma2hat is the estimator of variance of epsilon;

- some coments: the method of estimation for AR(p) is OLS.

### Example

  editing

## estimate_VAR.m

This function aims at solve VAR(p) model, which has a form 
$$
\begin{align}
\mathbf{y}_t&=\mathbf{b}+B_t\mathbf{y}_{t-1}+...+B_p\mathbf{y}_{t-p}+\boldsymbol{\epsilon}_t,\\
\mathbf{y}_t&=(y_1,y_2,...,y_q)^\mathrm{T}.
\end{align}
$$
The function in this file is 

```matlab
Bhat=estimate_VAR(Y,p),
```

where

- Y is a matrix, i.e. $$Y=[y_1,y_2,...,y_q]$$ where $y_i$ is the column vector of time series data sorted by time increasingly.
- p is the parameter in VAR(p) model.
- $$Bhat=[b,B_1,...,B_p]$$ is the estimation of parameters.

### Example

editing

## loglike_MA.m

This file aims to compute the log-likelihood of MA(p) model. The MA(p) model has a form as 
$$
y_t=\mu+\epsilon_t+\theta_1\epsilon_{t-1}+\theta_2\epsilon_{t-2}+...+\theta_p\epsilon_{t-p}.
$$
The function in this file is 

```matlab
loglikelihood=loglike_MA(thetas,p,y,muexist)
```

where 

- p is the parameter of MA(p).
- y is a column vector of time series data sorted by time increasingly.
- muexist is a bool value. TRUE for the existence of $\mu$, FALSE otherwise.
- thetas is a column vector containing the $$\theta_i$$ and $\mu$ in this model. thetas=$$[\theta_1; \theta_2;...;\theta_p; \mu]$$ if muexist=TRUE and hetas=$$[\theta_1; \theta_2;...;\theta_p]$$ if muexist=FALSE.

### Example

  editing

## estimate_IAR.m
This function aims at solving the IAR(I,p) model that has a form as
$$
x_t=\mu+\phi_1x_{t-1}+...\phi_px_{t-p}+\epsilon_t,\\
x_t=y_t-y_{t-1}.
$$
And the function is
```matlab
[phihat,sigma2hat]=estimate_IAR(I,p,y,muexist)
```

where 
- I is the times of difference.
- p is the parameter in IAR(I,p).
- muexist is a bool value. muexist=TRUE if $$\mu$$ is existed, muexist=FALSE otherwise.
- phihat=[$$\mu, \phi_1,...,\phi_p$$] if muexist=TRUE and phihat=[$$ \phi_1,...,\phi_p$$] if muexist=FALSE.
- sigma2hat is the variance of $$\epsilon$$
- the method of estimation is OLS
### Example
editing

## loglike_ARMA.m

This file aims at computing the log-likelihood of ARMA(p,q) model. The ARMA(p,q) has a form as
$$
y_t=\mu+\phi_1y_{t-1}+...+\phi_py_{t-p}+\epsilon_t+\psi_1\epsilon_{t-1}+...+\psi_q\epsilon_{t-q}.
$$
The function in this file is 
```matlab
loglikelihood=loglike_ARMA(thetas,p,q,y,muexist)
```

where
- muexist is a bool value. muexist=TRUE if $$\mu$$ is existed, muexist=FALSE otherwise.
- y is a column vector of time series data sorted by time increasingly.
- thetas=$$[\phi_1,\phi_2,...,\phi_p, \psi_1,\psi_2,...\psi_q, sigma2, \mu]$$ if muexist=TRUE and thetas=$$[\phi_1,\phi_2,...,\phi_p, \psi_1,\psi_2,...\psi_q, sigma2]$$ if muexist=FALSE.
