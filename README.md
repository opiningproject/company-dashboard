# Company dashboard

The dashboard for the company behind Opining, not for the restaurants using it.
Where [opining-dashboard](https://github.com/opiningproject/opining-dashboard) shows
one restaurant its orders, this one shows the SaaS owner the business: recurring
revenue, accounts, trials, churn, invoices and support.

Static prototype: HTML, CSS and vanilla JavaScript, no dependencies and no build step.
Open `index.html` in a browser, or serve the folder.

## Pages

| Page | What it answers |
| --- | --- |
| Dashboard | MRR, net new MRR, paying accounts, churn, and what needs attention today |
| Accounts | Every paying account with orders, last activity and health score |
| Trials | Who is trialing, how long they have left, and whether they activated |
| Churn risk | Accounts to call this week, and why customers leave |
| MRR movement | New, reactivation and churn, month by month — with one price there is no expansion line |
| Invoices | What was billed and collected, with a downloadable invoice per row |
| Failed payments | Declined cards, retry schedule and the money still open |
| Analytics | Signups, funnel, unit economics and cohort retention |
| Pricing | The one price of € 29 excl. VAT, what an account is worth at it, and what a second tier would answer |
| Acquisition | Where accounts come from, and what each channel costs |
| Campaigns | Onboarding, dunning and expansion emails |
| Referrals | The referral programme and who brings in accounts |
| Feature adoption | Which features get used, and by how many accounts |
| Changelog | What shipped, and what customers ask for next |
| Support | Open tickets, first reply time and satisfaction |
| Team | Who has access, and what each role may do |

Settings sits behind the gear in the sidebar: company details, billing, API keys,
webhooks, emails, notifications, security and your own account.

## Pricing

One plan: **€ 29 per month, excluding VAT** (€ 35,09 including 21%). Every number in
the dashboard follows from it — MRR is simply the account count × € 29, revenue churn
equals logo churn, and net revenue retention cannot pass 100% until there is a second
price to upgrade to.

## Files

- `index.html` — markup for every page, plus the icon sprite
- `styles.css` — design tokens first; change a colour or a radius in section 1 and it lands everywhere
- `app.js` — navigation, settings overlay, save bar, toasts, search, pagination and tabs

The design foundation is shared with the restaurant dashboard on purpose: same
tokens, same components, same interaction patterns, so both stay maintainable
as one system.

## Data

All numbers in the markup are example data. In production you replace the static
rows with your own; sections 2 and 3 of `app.js` are the only parts a router
would take over.
