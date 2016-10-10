# HLSettingsView
A better to manage user preferences

## Inspiration
The current way of handling preferences options on iOS is somewhat frustrating: too many options, too many layers and too much blank spaces. There's gotta be a better to do it. That's why I built this framework.

## What it does
It presents users a clear, simple collection view with all the options. It also uses the new UIPreviewInteraction API along with 3D Touch to navigate the layers and toggle switches. ("peek - preview" delegate callbacks also provided, "pop - commit" stage redirects to generic custom settings view controllers)

## How I built it
Xcode 8 GM + iOS 10 GM

## Challenges I ran into
lack of documentation on 3D Touch and lack of time

## Accomplishments that I'm proud of
The outcome looks really good

## What's next for HLSettingsView
This is an ongoing project. I will try to complete the framework once iOS 10 is officially released next week.
