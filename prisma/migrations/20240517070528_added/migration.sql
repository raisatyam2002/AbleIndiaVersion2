-- CreateTable
CREATE TABLE "Skills" (
    "skillid" SERIAL NOT NULL,
    "modeOfInternship" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("skillid")
);

-- CreateTable
CREATE TABLE "Portfolio" (
    "id" SERIAL NOT NULL,
    "githubLink" TEXT,
    "leetCodeLink" TEXT,
    "figmaLink" TEXT,
    "skillId" INTEGER NOT NULL,

    CONSTRAINT "Portfolio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "projectName" TEXT NOT NULL,
    "skillUsed" TEXT[],
    "projectLink" TEXT,
    "description" TEXT,
    "skillId" INTEGER NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdditonalDetails" (
    "id" SERIAL NOT NULL,
    "linkedinLink" TEXT,
    "competitiveRank" TEXT,
    "POR" TEXT,
    "internship" TEXT,
    "skillId" INTEGER NOT NULL,

    CONSTRAINT "AdditonalDetails_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Skills_userId_key" ON "Skills"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Portfolio_skillId_key" ON "Portfolio"("skillId");

-- CreateIndex
CREATE UNIQUE INDEX "AdditonalDetails_skillId_key" ON "AdditonalDetails"("skillId");

-- AddForeignKey
ALTER TABLE "Skills" ADD CONSTRAINT "Skills_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Portfolio" ADD CONSTRAINT "Portfolio_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills"("skillid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills"("skillid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdditonalDetails" ADD CONSTRAINT "AdditonalDetails_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills"("skillid") ON DELETE RESTRICT ON UPDATE CASCADE;
