import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/skill/domain/entities/domain.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';
import 'package:tieup/features/skill/domain/entities/sub_domain.dart';
import 'package:tieup/features/skill/presentation/Bloc/skill_bloc.dart';

class AddSkillsDialog extends StatefulWidget {
  AddSkillsDialog({this.skillSection = false, Key? key}) : super(key: key);
  bool skillSection;

  @override
  State<AddSkillsDialog> createState() => _AddSkillsDialogState();
}

class _AddSkillsDialogState extends State<AddSkillsDialog> {
  List<Domain> domains = [];
  List<SubDomain> subDomains = [];
  List<Skill> skills = [];
  List<bool> skillsStatus = [];
  Domain? selectedDomain;
  SubDomain? selectedSubDomain;
  List<Skill> selectedSkills = [];

  List<DropdownMenuItem<Domain>> domainItems() {
    List<DropdownMenuItem<Domain>> dropDownItems = [];
    for (Domain domainItem in domains) {
      var item =
          DropdownMenuItem(value: domainItem, child: Text(domainItem.name));
      dropDownItems.add(item);
    }
    return dropDownItems;
  }

  List<DropdownMenuItem<SubDomain>> subDomainItems() {
    List<DropdownMenuItem<SubDomain>> dropDownItems = [];
    for (SubDomain subDomainItem in subDomains) {
      var item = DropdownMenuItem(
          value: subDomainItem, child: Text(subDomainItem.name));
      dropDownItems.add(item);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        child: BlocListener<SkillBloc, SkillState>(
          listener: (context, state) {
            if (state is DomainsLoaded) {
              domains
                ..clear()
                ..addAll(state.domains);
              setState(() {});
            } else if (state is SubDomainsLoaded) {
              subDomains.addAll(state.subDomains);
              setState(() {});
            } else if (state is SkillsLoaded) {
              setState(() {
                print(state.skills);
                skills
                  ..clear()
                  ..addAll(state.skills);
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.skillSection ? 'Add Skills ' : 'Add Job role',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  )),
              const Text('Choose Domain'),
              DropdownButton<Domain>(
                isExpanded: true,
                value: selectedDomain,
                items: domainItems(),
                onChanged: (value) {
                  context
                      .read<SkillBloc>()
                      .add(GetSubDomainsEvent(domainId: value!.id));
                  setState(() {
                    selectedDomain = value;
                    selectedSubDomain = null;
                    subDomains.clear();
                    skills.clear();
                  });
                },
              ),
              const Text('Choose Sub Domain'),
              DropdownButton<SubDomain>(
                isExpanded: true,
                value: selectedSubDomain,
                items: subDomainItems(),
                onChanged: (value) {
                  context
                      .read<SkillBloc>()
                      .add(GetSkillsEvent(subDomainId: value!.id));
                  setState(() {
                    selectedSubDomain = value;
                    selectedSkills = [];
                  });
                },
              ),
              const SizedBox(
                height: 4,
              ),
              if (widget.skillSection) ...{
                const Text('Choose Skills'),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(itemBuilder: (_,index)=>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              skillsStatus[index] = !skillsStatus[index];
                              selectedSkills.add(skills[index]);
                            });
                          },
                          child: SkillContainer(
                              selectedSkills: selectedSkills,
                              skill: skills[index]),
                        ),
                      ),
                    itemCount: skills.length,
                  ),
                )
                ,
                // Wrap(
                //   spacing: 4.w,
                //     runSpacing: 4.w,
                //     direction: Axis.horizontal,
                //     children: List.generate(
                //       skills.length,
                //           (index) {
                //         return
                //       },
                //     ),
                //   ),
              },
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: kPrimaryColor),
                    ),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          widget.skillSection
                              ? selectedSkills
                              : selectedSubDomain);
                    },
                    child: Text('Add'),
                    style: TextButton.styleFrom(
                      side: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SkillContainer extends StatefulWidget {
  SkillContainer({Key? key, required this.skill, required this.selectedSkills})
      : super(key: key);

  final Skill skill;
  List<Skill> selectedSkills;

  @override
  State<SkillContainer> createState() => _SkillContainerState();
}

class _SkillContainerState extends State<SkillContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.selectedSkills.add(widget.skill);
        });
      },
      child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : Colors.white,
              border: Border.all(color: kPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(25.r)),
          child: Text(
            widget.skill.name,
            style: TextStyle(color: isSelected ? Colors.white : kPrimaryColor),
          )
          // child: const Center(child: Text('Team work',style: TextStyle(color: Colors.white),)),
          ),
    );
  }
}
