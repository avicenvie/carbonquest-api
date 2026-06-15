-- Fix FK constraints: ensure SET NULL so points are preserved when quiz/mission deleted
-- This is a new migration to fix existing databases where CASCADE was previously applied

-- Ensure id_answer is nullable
ALTER TABLE "Sessions" ALTER COLUMN "id_answer" DROP NOT NULL;

-- Sessions -> Answers: SET NULL (preserve session/points when answer is deleted)
ALTER TABLE "Sessions" DROP CONSTRAINT IF EXISTS "Sessions_id_answer_fkey";
ALTER TABLE "Sessions" ADD CONSTRAINT "Sessions_id_answer_fkey" FOREIGN KEY ("id_answer") REFERENCES "Answers"("id_answer") ON DELETE SET NULL ON UPDATE CASCADE;

-- Sessions -> Users: CASCADE (delete sessions when user is deleted)
ALTER TABLE "Sessions" DROP CONSTRAINT IF EXISTS "Sessions_id_user_fkey";
ALTER TABLE "Sessions" ADD CONSTRAINT "Sessions_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "Users"("id_user") ON DELETE CASCADE ON UPDATE CASCADE;

-- Ensure id_mission is nullable
ALTER TABLE "User_Missions" ALTER COLUMN "id_mission" DROP NOT NULL;

-- User_Missions -> Missions: SET NULL (preserve points when mission is deleted)
ALTER TABLE "User_Missions" DROP CONSTRAINT IF EXISTS "User_Missions_id_mission_fkey";
ALTER TABLE "User_Missions" ADD CONSTRAINT "User_Missions_id_mission_fkey" FOREIGN KEY ("id_mission") REFERENCES "Missions"("id_mission") ON DELETE SET NULL ON UPDATE CASCADE;

-- User_Missions -> Users: CASCADE (delete user_mission when user is deleted)
ALTER TABLE "User_Missions" DROP CONSTRAINT IF EXISTS "User_Missions_id_user_fkey";
ALTER TABLE "User_Missions" ADD CONSTRAINT "User_Missions_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "Users"("id_user") ON DELETE CASCADE ON UPDATE CASCADE;
