using System;
using System.Collections.Generic;
using System.IO;
using static System.Console;

namespace CurtisProject1
{
    /*
     * Curtis Ford
     * Project 1 Play Ball
     * This project has the user go through a menu to enter in player data or view player data
    */
    class Program
    {
        public static List<Player> players=new List<Player>();
        //Public list that contains all the player info

        static void Main(string[] args)
        {

            if (L1Init()) //runs the program if the init doesn't throw any errors
            {
                string option = L1MainMenu(); //priming menu, returns numbers 1-3
                while(option != "3") //runs while the option menu returns is not 3
                {
                    if (option == "1")
                    {
                        L1DataEntry();
                    }
                    else
                    {
                        L1SummaryDisplay();
                    }
                    option = L1MainMenu();
                }
            }
            
        }

        

        static bool L1Init()
        {
            const string FILENAME = "players.txt";

            try//tries to read in the names from players.txt into a list of Player objects
            {
                FileStream inFile = new FileStream(FILENAME, FileMode.Open, FileAccess.Read);
                StreamReader reader = new StreamReader(inFile);
                string recordIn;
                recordIn = reader.ReadLine();
                while (recordIn != null)
                {
                    Player pPtemp = new Player(recordIn);
                    players.Add(pPtemp);
                    recordIn = reader.ReadLine();
                }
                reader.Close();
                inFile.Close();
                return true;
            }
            catch (Exception)
            {
                WriteLine("Error reading players.txt");
                ReadLine();
                return false;
            }
        }

        /**
         * Asks the user to enter in an option and returns the validated  option they selected.
         */
        private static string L1MainMenu()
        {
            string response = "";
            bool invalidResponse = true;
            while (invalidResponse)
            {
                WriteLine("Enter 1 to enter player batting data.");
                WriteLine("Enter 2 to view summary.");
                WriteLine("Enter 3 to exit program.");
                response = ReadLine().Trim();
                if (response != "1" && response != "2" && response != "3")
                {
                    WriteLine(response + " is not a valid response, please try again\n");
                }
                else
                {
                    invalidResponse = false;
                    
                }
            }
            return response;
        }

        /**prompts the user to enter in data for a player that they select
         */ 
        private static void L1DataEntry()
        {
            int playerNum = 0;
            do
            {
                playerNum = L2PlayerNumEntry();
                if (playerNum > -1)
                {
                    WriteLine(players[playerNum].Name);
                    players[playerNum].AtBats += L2BatsEntry();
                    players[playerNum].Hits += L2HitsEntry(players[playerNum].AtBats);
                }
            } while (playerNum > -1);
        }

        /**Displays information that has been entered
         */
        private static void L1SummaryDisplay()
        {
            WriteLine("\n{0,-10}{1,8}{2,8}{3,8}", "Player", "At Bats", "Hits", "Average");
            foreach(Player thePlayer in players)
            {
                WriteLine("{0,-10}{1,8}{2,8}{3,8}", thePlayer.Name, thePlayer.AtBats, thePlayer.Hits, L2CalcAvg(thePlayer.Hits, thePlayer.AtBats));
            }
            WriteLine("\n");
            ReadLine();
        }

        /**calculates the hitting average, if atBats is zero, it returns zero
         */
        private static string L2CalcAvg(int hits, int atBats)
        {
            if(atBats == 0)
            {
                return "0";
            }
            else
            {
                return (hits*(1.0) / atBats).ToString(".000");
            }
        }

        /**prompts the user to enter in a valid user number, or return to main menu.
         */
        private static int L2PlayerNumEntry()
        {
            int pNum = 0;
            bool invalNum = true;

            do
            {
                try
                {
                    WriteLine("Please enter player number (1-12), or enter 0 to return to main menu.");
                    string tempStr = ReadLine().Trim();
                    pNum = Int32.Parse(tempStr);
                    if(pNum >= 1 && pNum <= 12)
                    {
                        invalNum = false;
                    }
                    else
                    {
                        if(pNum == 0)
                        {
                            invalNum = false;
                        }
                        else
                        {
                            WriteLine(tempStr + " is not a valid player number, please try again");
                        }
                        
                    }

                }
                catch (Exception)
                {
                    WriteLine("The data you entered is not valid, please try again");
                }
            } while (invalNum);

            return pNum-1;
            
        }

        /**prompts for number of at bats they have had.
         */
        private static int L2BatsEntry()
        {
            bool validEntry = true;
            int atBats =  0;
            do
            {
                validEntry = true;
                try
                {
                    WriteLine("How many at bats have they had?");
                    atBats = Int32.Parse(ReadLine().Trim());
                    if (atBats < 0)
                    {
                        WriteLine("You have to have at least 0 at bats to enter anything in.");
                        validEntry = false;
                    }
                }
                catch (Exception)
                {
                    WriteLine("Data entered not numeric, please try again");
                    validEntry = false;
                }
            } while (!validEntry);

            return atBats;
        }

        /**prompts the user for how many hits they got, recieves how many bats they have had to make sure they don't have more hits than at bats
         */
        private static int L2HitsEntry(int atBats)
        {
            bool validEntry = true;
            int hits = 0;
            do
            {
                validEntry = true;
                try
                {
                    WriteLine("How many times have they hit?");
                    hits = Int32.Parse(ReadLine().Trim());
                    if (hits < 0)
                    {
                        WriteLine("You have to have at least 0 hits to enter anything in.");
                        validEntry = false;
                    }
                    if(hits > atBats)
                    {
                        WriteLine("You cannot have more hits than bats, please try again.");
                        validEntry = false;
                    }
                }
                catch (Exception)
                {
                    WriteLine("Data entered not numeric, please try again");
                    validEntry = false;
                }
            } while (!validEntry);

            return hits;
        }
    }


    /**class that stores player data
     */
    class Player
    {
        public string Name { get; set; }
        public int AtBats { get; set; }
        public int Hits { get; set; }

        public Player(string name)
        {
            Name = name;
        }
    }
}
