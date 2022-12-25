import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tieup/constants.dart';
import 'package:tieup/features/add_skills/domain/entities/domain.dart';
import 'package:tieup/features/add_skills/domain/entities/sub_domain.dart';
import 'package:tieup/features/add_skills/presentation/Bloc/skill_bloc.dart';

class AddSkillsDialog extends StatefulWidget {
  const AddSkillsDialog({Key? key}) : super(key: key);

  @override
  State<AddSkillsDialog> createState() => _AddSkillsDialogState();
}

class _AddSkillsDialogState extends State<AddSkillsDialog> {
  List<Domain> domains = [];
  List<SubDomain> subDomains = [];
  Domain? selectedDomain;
  SubDomain? selectedSubDomain;

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
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Add Job role',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  )),
              const Text('Chose Domain'),
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
                  });
                },
              ),
              const Text('Chose Sub Domain'),
              DropdownButton<SubDomain>(
                isExpanded: true,
                value: selectedSubDomain,
                items: subDomainItems(),
                onChanged: (value) {
                  setState(() {
                    selectedSubDomain = value;
                  });
                },
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                    style: TextButton.styleFrom(
                      side: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                  SizedBox(width: 8,),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context,selectedSubDomain);
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
