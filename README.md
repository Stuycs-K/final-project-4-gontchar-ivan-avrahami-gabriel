[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project

## Group Info
Ivan Gontchar & Gabriel Avrahami

String groupName = new String(“HomeRunGuaranteedHomeRunGuaranteed”);

## Overview
Our game is a bird’s eye view-oriented game (2D) that simulates a baseball game. 2 players control their own teams, which will alternate pitching and batting. The batter is controlled using the mouse. A swinging mechanic allows the batter to hit the ball. If the hit is good, it will go further out for the catcher to try and catch, while a strike or foul will work as they do in a normal baseball game. The other player first pitches the ball. If the batter hits it, an outfield player must run to try and pick it up or catch it using WASD. Then they can press a number key to specify which base to throw the ball to. Most rules simply follow traditional baseball rules. A scoreboard on the left side displays crucial data points and a screen on the right has a flowing list of major events in the game.

Compiling the game: left-click run (wow so complicated). No libraries needed.

## Instructions
1. Player 1 controls the pitching keys, the number keys, and the WASD keys. Player 2 controls the Mouse.
2. First, Player 1 pitches the ball. F throws a fastball, C throws a curveball, and P gives a 50/50 chance of either.
3. Player 2 swings with left click as the ball crosses home plate.
4. If you swing to the left of the ball, it will go right, and vice versa. Swinging at approximately the same height as the ball will cause it to be hit faster.
5. A ball hit to the right of the rightmost base or left of the leftmost base will go foul, causing a re-hit.
6. In the event of a good hit, the batter will automatically start running.
7. Player 1 should use WASD to control the fielder to try to pick up the ball.
8. If the ball is caught, Player 1 uses the 1-2-3-4 keys to throw the ball to the base they want (1 is the base on the right, and it goes counterclockwise from there).
9. If the ball makes it to the base before the player, they will be out.
10. Player 2 can right click as they approach each base to indicate they want to go to the next one.
11. The roles of Player 1 and Player 2 switch after 3 outs, like in regular baseball.
12. When the game gets through 9 innings, a winner is declared or it goes into overtime if the score is tied.

Pressing 8 takes you to the 8th inning. Do this before the game starts if you want a shorter, 2-inning game.
Pressing 9 takes you near to the end of the game with 9 innings, 2 strikes and 2 outs for a high leverage situation (you're losing 1-0).

## Video Presentation Link:
https://drive.google.com/file/d/119lSREfyPPxc1_9__WCb27NNxpqVlUpe/view?usp=sharing

## Major Bugs:
Don't right-click before the game starts, or before the pitch has been made. Please don't.

It is technically possible that a runner gets stuck at a base because certain runners get to their base one tick before others. Nothing you can really do to avoid it but it's rare.

Sometimes a hit will be recorded instead of a foul if it's really close.
