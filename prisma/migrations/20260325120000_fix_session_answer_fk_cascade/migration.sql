-- Fix FK mismatches between Prisma schema and actual DB constraints
-- Prisma schema specifies onDelete: Cascade for these, but migrations created them as RESTRICT

-- 1. Sessions -> Answers: change from RESTRICT to CASCADE
ALTER TABLE "Sessions" DROP CONSTRAINT "Sessions_id_answer_fkey";
ALTER TABLE "Sessions" ADD CONSTRAINT "Sessions_id_answer_fkey" FOREIGN KEY ("id_answer") REFERENCES "Answers"("id_answer") ON DELETE CASCADE ON UPDATE CASCADE;

-- 2. Sessions -> Users: change from RESTRICT to CASCADE
ALTER TABLE "Sessions" DROP CONSTRAINT "Sessions_id_user_fkey";
ALTER TABLE "Sessions" ADD CONSTRAINT "Sessions_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "Users"("id_user") ON DELETE CASCADE ON UPDATE CASCADE;

-- 3. User_Missions -> Users: change from RESTRICT to CASCADE
ALTER TABLE "User_Missions" DROP CONSTRAINT "User_Missions_id_user_fkey";
ALTER TABLE "User_Missions" ADD CONSTRAINT "User_Missions_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "Users"("id_user") ON DELETE CASCADE ON UPDATE CASCADE;

-- 4. User_Missions -> Missions: change from RESTRICT to CASCADE
ALTER TABLE "User_Missions" DROP CONSTRAINT "User_Missions_id_mission_fkey";
ALTER TABLE "User_Missions" ADD CONSTRAINT "User_Missions_id_mission_fkey" FOREIGN KEY ("id_mission") REFERENCES "Missions"("id_mission") ON DELETE CASCADE ON UPDATE CASCADE;
